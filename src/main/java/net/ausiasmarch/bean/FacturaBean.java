package net.ausiasmarch.bean;

import com.google.gson.annotations.Expose;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class FacturaBean implements BeanInterface {

    @Expose
    private Integer id;
    @Expose
    private Date fecha;
    @Expose
    private Integer iva;
    @Expose
    private Integer usuario_id;

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Integer getIva() {
		return iva;
	}

	public void setIva(Integer iva) {
		this.iva = iva;
	}

	public Integer getUsuario_id() {
		return usuario_id;
	}

	public void setUsuario_id(Integer usuario_id) {
		this.usuario_id = usuario_id;
	}

    @Override
    public FacturaBean fill(ResultSet oResultSet) throws SQLException {
            this.setId(oResultSet.getInt("id"));
            this.setFecha(oResultSet.getDate("fecha"));
            this.setIva(oResultSet.getInt("iva"));
            return this;
    }

    @Override
    public PreparedStatement orderSQL(List<String> orden, PreparedStatement oPreparedStatement, int i) throws SQLException {
                        if (orden.get((i-1)).equalsIgnoreCase("id")) {
        			oPreparedStatement.setInt(i, 1);
        		} else if (orden.get((i-1)).equalsIgnoreCase("fecha")) {
        			oPreparedStatement.setInt(i, 2);
        		} else if (orden.get((i-1)).equalsIgnoreCase("iva")) {
        			oPreparedStatement.setInt(i, 3);
        		} else if (orden.get((i-1)).equalsIgnoreCase("usuario_id")) {
        			oPreparedStatement.setInt(i, 4);
        		}
                        return oPreparedStatement;
    }

    @Override
    public String getField4Insert() throws SQLException {
        return "(fecha,iva,usuario_id)";
    }
    
    @Override
    public BeanInterface setField4Insert() throws SQLException {
        return ;
    }
    
    @Override
    public String getField4Update() throws SQLException {
        return "INSERT INTO compra (cantidad,producto_id,factura_id) VALUES(?,?,?)";
    }
    
    @Override
    public BeanInterface setField4Update() throws SQLException {
        return ;
    }
}
