package net.ausiasmarch.bean;

import com.google.gson.annotations.Expose;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class CompraBean implements BeanInterface {

    @Expose
    private Integer id;
    @Expose
    private Integer cantidad;
    @Expose
    private Integer producto_id;
    @Expose
    private Integer factura_id;

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Integer getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(Integer producto_id) {
        this.producto_id = producto_id;
    }

    public Integer getFactura_id() {
        return factura_id;
    }

    public void setFactura_id(Integer factura_id) {
        this.factura_id = factura_id;
    }

    @Override
    public CompraBean fill(ResultSet oResultSet) throws SQLException {
        this.setId(oResultSet.getInt("id"));
        this.setCantidad(oResultSet.getInt("cantidad"));
        return this;
    }
    
    @Override
    public PreparedStatement orderSQL(List<String> orden, PreparedStatement oPreparedStatement, int i) throws SQLException {
                        if (orden.get((i-1)).equalsIgnoreCase("id")) {
        			oPreparedStatement.setInt(i, 1);
        		} else if (orden.get((i-1)).equalsIgnoreCase("cantidad")) {
        			oPreparedStatement.setInt(i, 2);
        		} else if (orden.get((i-1)).equalsIgnoreCase("producto_id")) {
        			oPreparedStatement.setInt(i, 3);
        		} else if (orden.get((i-1)).equalsIgnoreCase("factura_id")) {
        			oPreparedStatement.setInt(i, 4);
        		}
                        return oPreparedStatement;
    }
    
    public String getField4Insert() throws SQLException {
        return "INSERT INTO compra (cantidad,producto_id,factura_id) VALUES(?,?,?)";
    }
    
    public BeanInterface setField4Insert() throws SQLException {
        this.setString(1, oProductoBean.getCodigo());
        this.setInt(2, oProductoBean.getExistencias());
        this.setDouble(3, oProductoBean.getPrecio());
        this.setString(4, oProductoBean.getImagen());
        this.setString(5, oProductoBean.getDescripcion());
        this.setInt(6, oProductoBean.getTipo_producto_id());
        return this;
    }
    
    public String getField4Update() throws SQLException {
        return "INSERT INTO compra (cantidad,producto_id,factura_id) VALUES(?,?,?)";
    }
    
    public TipoUsuarioBean setField4Update() throws SQLException {
        return ;
    }
}
