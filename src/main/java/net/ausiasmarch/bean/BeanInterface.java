package net.ausiasmarch.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface BeanInterface {

    Integer getId();

    void setId(Integer id);

    public BeanInterface fill(ResultSet oResultSet, Connection oConnection, int spread) throws Exception;

    public PreparedStatement orderSQL(List<String> orden, PreparedStatement oPreparedStatement) throws Exception;

    public String getFieldInsert();

    public String getFieldConcat(int numparam);
    
    public PreparedStatement setFieldInsert(BeanInterface oBeanParam, PreparedStatement oPreparedStatement) throws Exception;

    public String getFieldUpdate();

    public PreparedStatement setFieldUpdate(BeanInterface oBeanParam, PreparedStatement oPreparedStatement) throws Exception;

}
