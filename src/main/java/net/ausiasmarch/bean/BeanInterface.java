package net.ausiasmarch.bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface BeanInterface {

    Integer getId();

    void setId(Integer id);

    public BeanInterface fill(ResultSet oResultSet) throws SQLException;
    
    public PreparedStatement orderSQL(List<String> orden, PreparedStatement oPreparedStatement, int i) throws SQLException;
    
    public String getField4Insert() throws SQLException;
    
    public BeanInterface setField4Insert() throws SQLException;
    
    public String getField4Update() throws SQLException;
    
    public BeanInterface setField4Update() throws SQLException;

}
