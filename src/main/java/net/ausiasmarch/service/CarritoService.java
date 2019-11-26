package net.ausiasmarch.service;

import com.google.gson.Gson;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import net.ausiasmarch.bean.CompraBean;
import net.ausiasmarch.bean.FacturaBean;
import net.ausiasmarch.bean.ItemBean;
import net.ausiasmarch.bean.ProductoBean;
import net.ausiasmarch.bean.ResponseBean;
import net.ausiasmarch.bean.UsuarioBean;
import net.ausiasmarch.connection.ConnectionInterface;
import net.ausiasmarch.dao.CompraDao;
import net.ausiasmarch.dao.FacturaDao;
import net.ausiasmarch.dao.ProductoDao;
import net.ausiasmarch.dao.UsuarioDao;
import net.ausiasmarch.factory.ConnectionFactory;
import net.ausiasmarch.factory.GsonFactory;
import net.ausiasmarch.setting.ConnectionSettings;

public class CarritoService {

// API
//json?ob=carrito&op=add&id=??&cantidad=??
//json?ob=carrito&op=remove&id=??&cantidad=??
//json?ob=carrito&op=list
//json?ob=carrito&op=empty
//json?ob=carrito&op=buy
    HttpServletRequest oRequest = null;

    public CarritoService(HttpServletRequest oRequest) {
        this.oRequest = oRequest;

    }

    public String add() throws Exception {
        @SuppressWarnings("unchecked")
        ItemBean oItemBean = null;
        int id = Integer.parseInt(oRequest.getParameter("id"));
        int cantidad = Integer.parseInt(oRequest.getParameter("cantidad"));
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        ProductoDao oProductoDao = null;
        ResponseBean oResponseBean = null;
        Gson oGson = GsonFactory.getGson();
        try {
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            ProductoBean oProductoBean = new ProductoBean(id);
            oProductoDao = new ProductoDao(oConnection);
            oProductoBean = (ProductoBean) oProductoDao.get(id);
            if (oProductoBean != null) {
                if (cantidad != 0) {
                    oItemBean = new ItemBean(cantidad, oProductoBean);
                    HttpSession oSession = oRequest.getSession();
                    ArrayList<ItemBean> alCarrito = (ArrayList<ItemBean>) oSession.getAttribute("carrito");
                    if (alCarrito == null) {
                        alCarrito = new ArrayList<ItemBean>();
                    }
                    oItemBean = find(alCarrito, oItemBean.getProducto_obj().getId());
                    if (oProductoBean.getExistencias() >= cantidad) {
                        if (oItemBean == null) {
                            oItemBean = new ItemBean(cantidad, oProductoBean);
                            alCarrito.add(oItemBean);
                            oRequest.getSession().setAttribute("carrito", alCarrito);
                            oResponseBean = new ResponseBean(200, "Nuevo producto añadido");
                        } else {
                            int oldCantidad = oItemBean.getCantidad();
                            int newCantidad = oldCantidad + cantidad;
                            if (oProductoBean.getExistencias() >= newCantidad) {
                                oItemBean.setCantidad(oldCantidad + cantidad);
                                oRequest.getSession().setAttribute("carrito", alCarrito);
                                oResponseBean = new ResponseBean(200, "Producto añadido");
                            } else {
                                oResponseBean = new ResponseBean(400, "No hay suficientes existencias para este producto");
                            }
                        }
                    } else {
                        oResponseBean = new ResponseBean(400, "No hay suficientes existencias para este producto");
                    }
                } else {
                    oResponseBean = new ResponseBean(400, "Selecciona una cantidad apropiada");
                }
            } else {
                oResponseBean = new ResponseBean(400, "Este producto no esta almacenador en la tienda");
            }

        } catch (Exception ex) {
            String msg = this.getClass().getName() + ":" + (ex.getStackTrace()[0]).getMethodName();
            throw new Exception(msg, ex);
        } finally {
            if (oConnection != null) {
                oConnection.close();
            }
            if (oConnectionImplementation != null) {
                oConnectionImplementation.disposeConnection();
            }
        }
        return oGson.toJson(oResponseBean);
    }

    public String remove() throws Exception {
        int id = Integer.parseInt(oRequest.getParameter("id"));
        HttpSession oSession = oRequest.getSession();
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        ProductoDao oProductoDao = null;
        ProductoBean oProductoBean = null;
        ResponseBean oResponseBean = null;
        Gson oGson = GsonFactory.getGson();
        try {
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            oProductoDao = new ProductoDao(oConnection);
            oProductoBean = (ProductoBean) oProductoDao.get(id);
            if (oProductoBean != null) {
                ArrayList<ItemBean> alCarrito = (ArrayList<ItemBean>) oSession.getAttribute("carrito");
                if (alCarrito != null) {
                    int resultadoFind = this.findRemove(alCarrito, id);
                    if (resultadoFind >= 0) {
                        alCarrito.remove(resultadoFind);
                        if (!alCarrito.isEmpty()) {
                            oRequest.getSession().setAttribute("carrito", alCarrito);
                            oResponseBean = new ResponseBean(200, "Ha eliminado el prodcto del carrito");
                        } else {
                            if (alCarrito.isEmpty()) {
                                oRequest.getSession().setAttribute("carrito", null);
                                oResponseBean = new ResponseBean(200, "El carrito se ha vaciado.");
                            }
                        }
                    } else {
                        oResponseBean = new ResponseBean(400, "El producto que quiere eliminar no esta en el carrito");
                    }
                } else {
                    oResponseBean = new ResponseBean(400, "El carrito esta vacio.");
                }
            } else {
                oResponseBean = new ResponseBean(400, "El producto que quieres eliminar no existe");
            }
        } catch (Exception ex) {
            String msg = this.getClass().getName() + ":" + (ex.getStackTrace()[0]).getMethodName();
            throw new Exception(msg, ex);
        } finally {
            if (oConnection != null) {
                oConnection.close();
            }
            if (oConnectionImplementation != null) {
                oConnectionImplementation.disposeConnection();
            }
        }
        return oGson.toJson(oResponseBean);
    }

    public String list() throws Exception {
        Gson oGson = GsonFactory.getGson();
        try {
            HttpSession oSession = oRequest.getSession();
            @SuppressWarnings("unchecked")
            ArrayList<ItemBean> alCarrito = (ArrayList<ItemBean>) oSession.getAttribute("carrito");
            return "{\"status\":200,\"message\":" + oGson.toJson(alCarrito) + "}";
        } catch (Exception ex) {

            return oGson.toJson(new ResponseBean(500, ex.getMessage()));
        }
    }

    public String empty() throws Exception {
        Gson oGson = GsonFactory.getGson();
        try {
            HttpSession oSession = oRequest.getSession();
            oSession.setAttribute("carrito", null);
            return oGson.toJson(new ResponseBean(200, "OK"));
        } catch (Exception ex) {
            return oGson.toJson(new ResponseBean(500, ex.getMessage()));
        }
    }

    private ItemBean find(ArrayList<ItemBean> alCarrito, int id) {

        for (int i = 0; i < alCarrito.size(); i++) {
            ItemBean oItemBean = alCarrito.get(i);
            if (id == (oItemBean.getProducto_obj().getId())) {
                return oItemBean;
            }
        }
        return null;
    }

    private int findRemove(ArrayList<ItemBean> alCarrito, int id) {
        for (int i = 0; i < alCarrito.size(); i++) {
            ItemBean oItemBean = alCarrito.get(i);
            if (oItemBean.getProducto_obj().getId() == id) {
                return i;
            }
        }
        return -1;
    }

    public String buy() throws Exception {
        HttpSession oSession = oRequest.getSession();
        ArrayList<ItemBean> alCarrito = (ArrayList) oSession.getAttribute("carrito");
        String usuario = (String) oSession.getAttribute("usuario");
        UsuarioBean oUsuarioBean = null;
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        Gson oGson = GsonFactory.getGson();
        ResponseBean oResponseBean = null;

        try {
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            if (usuario != null) {
                if (alCarrito != null && alCarrito.size() > 0) {
                    UsuarioDao oUsuarioDao = new UsuarioDao(oConnection);
                    oUsuarioBean = oUsuarioDao.get(usuario);
                    oConnection.setAutoCommit(false);
                    //CREA FACTURA
                    FacturaBean oFacturaBean = new FacturaBean();
                    ProductoDao oProductoDao = new ProductoDao(oConnection);
                    oFacturaBean.setUsuario_id(oUsuarioBean.getId());
                    oFacturaBean.setIva(21);
                    oFacturaBean.setFecha(Calendar.getInstance().getTime());
                    FacturaDao oFacturaDao = new FacturaDao(oConnection);
                    oFacturaBean.setId(oFacturaDao.insert(oFacturaBean));
                    //----------------------------------------------------                         
                    Iterator<ItemBean> iterator = alCarrito.iterator();
                    while (iterator.hasNext()) {
                        ItemBean oItemBean = iterator.next();
                        ProductoBean oProductoBean = oItemBean.getProducto_obj();
                        ProductoBean oProductoBeanDeDB = (ProductoBean) oProductoDao.get(oProductoBean.getId());
                        //COMPRUEBA EXISTENCIAS Y CREA COMPRA
                        if (oProductoBeanDeDB.getExistencias() >= oItemBean.getCantidad()) {
                            CompraBean oCompraBean = new CompraBean();
                            oCompraBean.setCantidad(oItemBean.getCantidad());
                            oCompraBean.setFactura_id(oFacturaBean.getId());
                            oCompraBean.setProducto_id(oProductoBean.getId());
                            CompraDao oCompraDao = new CompraDao(oConnection);
                            oCompraDao.insert(oCompraBean);
                            oCompraBean.setId(oCompraBean.getId());          
                            oProductoBean.setExistencias(oProductoBean.getExistencias() - oItemBean.getCantidad());
                            oProductoDao.update(oProductoBean);
                            oProductoDao.insert(oProductoBean);
                            oResponseBean = new ResponseBean(400, "Se ha realizado la compra");
                        } else {
                            oResponseBean = new ResponseBean(400, "No hay suficientes existencias");
                            return oGson.toJson(oResponseBean);
                        }
                    }
                    alCarrito.clear();
                    oConnection.commit();
                } else {
                    oResponseBean = new ResponseBean(400, "El carrito está vacio");
                }
            } else {
                oResponseBean = new ResponseBean(400, "Regístrate para realizar la compra");
            }
        } catch (Exception ex) {
            oConnection.rollback();
            String msg = this.getClass().getName() + ":" + (ex.getStackTrace()[0]).getMethodName();
            throw new Exception(msg, ex);
        } finally {
            if (oConnection != null) {
                oConnection.close();
            }
            if (oConnectionImplementation != null) {
                oConnectionImplementation.disposeConnection();
            }
        }
        return oGson.toJson(oResponseBean);
    }

}
