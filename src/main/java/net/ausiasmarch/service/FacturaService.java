package net.ausiasmarch.service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import net.ausiasmarch.bean.FacturaBean;
import net.ausiasmarch.bean.ResponseBean;
import net.ausiasmarch.connection.ConnectionInterface;
import net.ausiasmarch.dao.FacturaDao;
import net.ausiasmarch.factory.ConnectionFactory;
import net.ausiasmarch.factory.GsonFactory;
import net.ausiasmarch.setting.ConnectionSettings;

public class FacturaService implements ServiceInterface {

    HttpServletRequest oRequest = null;

    public FacturaService(HttpServletRequest oRequest) {
        this.oRequest = oRequest;
    }

    @Override
    public String get() throws Exception {
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        try {
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            int id = Integer.parseInt(oRequest.getParameter("id"));
            FacturaDao oFacturaDao = new FacturaDao(oConnection);
            FacturaBean oFacturaBean = oFacturaDao.get(id);
            Gson oGson = GsonFactory.getGson();
            String strJson = oGson.toJson(oFacturaBean);
            return "{\"status\":200,\"message\":" + strJson + "}";
        } catch (Exception ex) {
            String msg = this.getClass().getName() + " get method ";
            throw new Exception(msg, ex);
        } finally {
            if (oConnection != null) {
                oConnection.close();
            }
            if (oConnectionImplementation != null) {
                oConnectionImplementation.disposeConnection();
            }
        }
    }

    @Override
    public String getPage() throws Exception {
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        try {
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            int iRpp = Integer.parseInt(oRequest.getParameter("rpp"));
            int iPage = Integer.parseInt(oRequest.getParameter("page"));
            List<String> orden = null;
            if (oRequest.getParameter("order") != null) {
                orden = Arrays.asList(oRequest.getParameter("order").split("\\s*,\\s*"));
            }
            FacturaDao oFacturaDao = new FacturaDao(oConnection);
            ArrayList alFacturaBean = oFacturaDao.getPage(iPage, iRpp, orden);
            Gson oGson = GsonFactory.getGson();
            String strJson = oGson.toJson(alFacturaBean);
            return "{\"status\":200,\"message\":" + strJson + "}";
        } catch (Exception ex) {
            String msg = this.getClass().getName() + " get method ";
            throw new Exception(msg, ex);
        } finally {
            if (oConnection != null) {
                oConnection.close();
            }
            if (oConnectionImplementation != null) {
                oConnectionImplementation.disposeConnection();
            }
        }
    }

    @Override
    public String getCount() throws Exception {
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        try {
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            ResponseBean oResponseBean;
            Gson oGson = GsonFactory.getGson();
            FacturaDao oFacturaDao = new FacturaDao(oConnection);
            Integer iCount = oFacturaDao.getCount();
            if (iCount < 0) {
                oResponseBean = new ResponseBean(500, iCount.toString());
            } else {
                oResponseBean = new ResponseBean(200, iCount.toString());
            }
            return oGson.toJson(oResponseBean);
        } catch (Exception ex) {
            String msg = this.getClass().getName() + " get method ";
            throw new Exception(msg, ex);
        } finally {
            if (oConnection != null) {
                oConnection.close();
            }
            if (oConnectionImplementation != null) {
                oConnectionImplementation.disposeConnection();
            }
        }
    }

    @Override
    public String update() throws Exception {
        HttpSession oSession = oRequest.getSession();
        ResponseBean oResponseBean;
        Gson oGson = GsonFactory.getGson();
        if (oSession.getAttribute("usuario") != null) {
            ConnectionInterface oConnectionImplementation = null;
            Connection oConnection = null;
            try {
                oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
                oConnection = oConnectionImplementation.newConnection();
                FacturaBean oFacturaBean = new FacturaBean();
                String data = oRequest.getParameter("data");
                oFacturaBean = oGson.fromJson(data, FacturaBean.class);
                FacturaDao oFacturaDao=  new FacturaDao(oConnection);
                if (oFacturaDao.update(oFacturaBean) == 0) {
                    oResponseBean = new ResponseBean(500, "KO");
                } else {
                    oResponseBean = new ResponseBean(200, "OK");
                }
                return oGson.toJson(oResponseBean);
            } catch (Exception ex) {
                String msg = this.getClass().getName() + " get method ";
                throw new Exception(msg, ex);
            } finally {
                if (oConnection != null) {
                    oConnection.close();
                }
                if (oConnectionImplementation != null) {
                    oConnectionImplementation.disposeConnection();
                }
            }
        } else {
            oResponseBean = new ResponseBean(401, "Error: No session");
            return oGson.toJson(oResponseBean);
        }

    }

    @Override
    public String insert() throws Exception {
        HttpSession oSession = oRequest.getSession();
        ResponseBean oResponseBean;
        Gson oGson = GsonFactory.getGson();
        if (oSession.getAttribute("usuario") != null) {
            ConnectionInterface oConnectionImplementation = null;
            Connection oConnection = null;
            try {
                oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
                oConnection = oConnectionImplementation.newConnection();
                final GsonBuilder builder = new GsonBuilder();
                builder.excludeFieldsWithoutExposeAnnotation();
                FacturaBean oFacturaBean = oGson.fromJson(oRequest.getParameter("data"), FacturaBean.class);
                FacturaDao oFacturaDao = new FacturaDao(oConnection);
                if (oFacturaDao.insert(oFacturaBean) == 0) {
                    oResponseBean = new ResponseBean(500, "KO");
                } else {
                    oResponseBean = new ResponseBean(200, "OK");
                };
                return oGson.toJson(oResponseBean);
            } catch (Exception ex) {
                String msg = this.getClass().getName() + " get method ";
                throw new Exception(msg, ex);
            } finally {
                if (oConnection != null) {
                    oConnection.close();
                }
                if (oConnectionImplementation != null) {
                    oConnectionImplementation.disposeConnection();
                }
            }
        } else {
            oResponseBean = new ResponseBean(401, "Error: No session");
            return oGson.toJson(oResponseBean);
        }
    }

    @Override
    public String remove() throws Exception {
        HttpSession oSession = oRequest.getSession();
        ResponseBean oResponseBean;
        Gson oGson = GsonFactory.getGson();
        if (oSession.getAttribute("usuario") != null) {
            ConnectionInterface oConnectionImplementation = null;
            Connection oConnection = null;
            try {
                oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
                oConnection = oConnectionImplementation.newConnection();
                FacturaDao oFacturaDao = new FacturaDao(oConnection);
                int id = Integer.parseInt(oRequest.getParameter("id"));
                if (oFacturaDao.remove(id) == 0) {
                    oResponseBean = new ResponseBean(500, "KO");
                } else {
                    oResponseBean = new ResponseBean(200, "OK");
                }
                return oGson.toJson(oResponseBean);
            } catch (Exception ex) {
                String msg = this.getClass().getName() + " get method ";
                throw new Exception(msg, ex);
            } finally {
                if (oConnection != null) {
                    oConnection.close();
                }
                if (oConnectionImplementation != null) {
                    oConnectionImplementation.disposeConnection();
                }
            }
        } else {
            oResponseBean = new ResponseBean(401, "Error: No session");
            return oGson.toJson(oResponseBean);
        }
    }

    @Override
    public String fill() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}