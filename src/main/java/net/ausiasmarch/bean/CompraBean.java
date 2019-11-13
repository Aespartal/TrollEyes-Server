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
        if (orden.get((i - 1)).equalsIgnoreCase("id")) {
            oPreparedStatement.setInt(i, 1);
        } else if (orden.get((i - 1)).equalsIgnoreCase("cantidad")) {
            oPreparedStatement.setInt(i, 2);
        } else if (orden.get((i - 1)).equalsIgnoreCase("producto_id")) {
            oPreparedStatement.setInt(i, 3);
        } else if (orden.get((i - 1)).equalsIgnoreCase("factura_id")) {
            oPreparedStatement.setInt(i, 4);
        }
        return oPreparedStatement;
    }

    @Override
    public String getField4Insert() throws SQLException {
        return "INSERT INTO compra (cantidad,producto_id,factura_id) VALUES(?,?,?)";
    }

    @Override
    public int setField4Insert(PreparedStatement oPreparedStatement) throws SQLException {
        oPreparedStatement.setInt(1, this.getCantidad());
        oPreparedStatement.setInt(2, this.producto_id);
        oPreparedStatement.setInt(3, this.factura_id);
        int iResult = oPreparedStatement.executeUpdate();
        return iResult;
    }

    @Override
    public String getField4Update() throws SQLException {
        return "UPDATE compra SET (cantidad,producto_id,factura_id) VALUES(?,?,?) WHERE id=?";
    }

    @Override
    public int setField4Update(PreparedStatement oPreparedStatement) throws SQLException {
        oPreparedStatement.setInt(1, this.getCantidad());
        oPreparedStatement.setInt(2, this.producto_id);
        oPreparedStatement.setInt(3, this.factura_id);
        int iResult = oPreparedStatement.executeUpdate();
        return iResult;
    }
}
