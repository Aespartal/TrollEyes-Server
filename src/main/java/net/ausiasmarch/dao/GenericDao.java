package net.ausiasmarch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import net.ausiasmarch.bean.BeanInterface;
import net.ausiasmarch.factory.BeanFactory;

public class GenericDao implements DaoInterface {

    Connection oConnection = null;
    String ob = null;

    public GenericDao(Connection oConnection, String ob) {
        this.oConnection = oConnection;
        this.ob = ob;
    }

    public GenericDao(Connection oConnection) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BeanInterface get(int id) throws SQLException {
        PreparedStatement oPreparedStatement;
        ResultSet oResultSet;
        String strSQL = "SELECT * FROM " + ob + " WHERE id=?";
        oPreparedStatement = oConnection.prepareStatement(strSQL);
        oPreparedStatement.setInt(1, id);
        oResultSet = oPreparedStatement.executeQuery();
        BeanInterface oBean;
        if (oResultSet.next()) {
            oBean = BeanFactory.getBean(ob);
            oBean = oBean.fill(oResultSet);
        } else {
            oBean = null;
        }
        return oBean;
    }

    @Override
    public List<BeanInterface> getAll() throws SQLException {
        Statement stmt = oConnection.createStatement();
        ResultSet oResultSet = stmt.executeQuery("SELECT * FROM " + ob + " LIMIT 100");
        BeanInterface oBean;
        List<BeanInterface> listaBean = new ArrayList();
        while (oResultSet.next()) {
            oBean = BeanFactory.getBean(ob);
            oBean = oBean.fill(oResultSet);
            listaBean.add(oBean);
        }
        return listaBean;
    }

    @Override
    public int getCount() throws SQLException {
        PreparedStatement oPreparedStatement;
        ResultSet oResultSet;
        String strSQL = "SELECT count(*) FROM " + ob;
        oPreparedStatement = oConnection.prepareStatement(strSQL);
        oResultSet = oPreparedStatement.executeQuery();
        if (oResultSet.next()) {
            return oResultSet.getInt(1);
        } else {
            return -1;
        }
    }

    @Override
    public ArrayList getPage(int page, int limit, List<String> orden) throws SQLException {
        PreparedStatement oPreparedStatement;
        ResultSet oResultSet;
        int offset;

        if (page == 1) {
            offset = 0;
        } else {
            offset = (limit * page) - limit;
        }

        if (orden == null) {
            oPreparedStatement = oConnection.prepareStatement("SELECT * FROM " + ob + " LIMIT ? OFFSET ?");
            oPreparedStatement.setInt(1, limit);
            oPreparedStatement.setInt(2, offset);
        } else {
            String sqlQuery = "SELECT * FROM " + ob + " ORDER BY ";
            for (int i = 1; i <= orden.size(); i++) {
                if (orden.get((i - 1)).equalsIgnoreCase("asc")) {
                    sqlQuery += "ASC ";
                } else if (orden.get((i - 1)).equalsIgnoreCase("desc")) {
                    sqlQuery += "DESC ";
                } else {
                    sqlQuery += "? ";
                }
            }
            sqlQuery += "LIMIT ? OFFSET ?";
            oPreparedStatement = oConnection.prepareStatement(sqlQuery);
            BeanInterface oBean = null;
            for (int i = 1; i < orden.size(); i++) {
                oPreparedStatement = oBean.orderSQL(orden, oPreparedStatement, i);
            }
            oPreparedStatement.setInt((orden.size()), limit);
            oPreparedStatement.setInt((orden.size() + 1), offset);
        }

        oResultSet = oPreparedStatement.executeQuery();

        ArrayList<BeanInterface> oBeanList = new ArrayList<>();
        BeanInterface oBean;
        while (oResultSet.next()) {
            oBean = BeanFactory.getBean(ob);
            oBean = oBean.fill(oResultSet);
            oBeanList.add(oBean);
        }

        return oBeanList;
    }

    @Override
    public Integer insert(BeanInterface oBean) throws SQLException {
        PreparedStatement oPreparedStatement;
        oBean = BeanFactory.getBean(ob);
        String strsql = oBean.getField4Insert();
        oPreparedStatement = oConnection.prepareStatement(strsql);
        int iResult = oBean.setField4Insert(oPreparedStatement);
        return iResult;
    }

    @Override
    public Integer remove(int id) throws SQLException {
        PreparedStatement oPreparedStament;
        int iResult;
        String strSQL;
        strSQL = "DELETE FROM " + ob + " WHERE id=?";
        oPreparedStament = oConnection.prepareStatement(strSQL, Statement.RETURN_GENERATED_KEYS);
        oPreparedStament.setInt(1, id);
        iResult = oPreparedStament.executeUpdate();
        return iResult;
    }

    @Override
    public Integer update(BeanInterface oBean) throws SQLException {
        PreparedStatement oPreparedStatement;
        oBean = BeanFactory.getBean(ob);
        String strsql = oBean.getField4Update();
        oPreparedStatement = oConnection.prepareStatement(strsql, Statement.RETURN_GENERATED_KEYS);
        int iResult = oBean.setField4Update(oPreparedStatement);
        return iResult;
    }

}
