package net.ausiasmarch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import net.ausiasmarch.bean.BeanInterface;
import net.ausiasmarch.factory.BeanFactory;
import net.ausiasmarch.setting.ConfigurationSettings;

public class GenericDao implements DaoInterface {

    Connection oConnection = null;
    String ob = null;

    public GenericDao(Connection oConnection, String ob) {
        this.oConnection = oConnection;
        this.ob = ob;
    }

    @Override
    public BeanInterface get(int id) throws Exception {
        PreparedStatement oPreparedStatement = null;
        ResultSet oResultSet = null;
        BeanInterface oBean = null;
        String strSQL = "SELECT * FROM " + ob + " WHERE id=?";
        oPreparedStatement = oConnection.prepareStatement(strSQL);
        oPreparedStatement.setInt(1, id);
        oResultSet = oPreparedStatement.executeQuery();

        if (oResultSet.next()) {
            oBean = BeanFactory.getBean(ob);
            oBean = oBean.fill(oResultSet, oConnection, ConfigurationSettings.spread);
        } else {
            oBean = null;
        }
        return oBean;
    }

    @Override
    public int getCount() throws Exception {
        PreparedStatement oPreparedStatement = null;
        ResultSet oResultSet = null;
        try {
            String strSQL = "SELECT count(*) FROM " + ob;
            oPreparedStatement = oConnection.prepareStatement(strSQL);
            oResultSet = oPreparedStatement.executeQuery();
            if (oResultSet.next()) {
                return oResultSet.getInt(1);
            } else {
                return -1;
            }
        } catch (Exception ex) {
            String msg = this.getClass().getName() + " ob: " + ob + "; getcount method ";
            throw new Exception(msg, ex);
        } finally {
            if (oResultSet != null) {
                oResultSet.close();
            }
            if (oPreparedStatement != null) {
                oPreparedStatement.close();
            }
        }

    }

    @Override
    public ArrayList<BeanInterface> getPage(int page, int rpp, List<String> orden, String word) throws Exception {
        PreparedStatement oPreparedStatement = null;
        ResultSet oResultSet = null;
        ArrayList<BeanInterface> listaBean = new ArrayList<>();
        try {
            BeanInterface oBean = BeanFactory.getBean(ob);
            int offset;
            if (page == 1) {
                offset = 0;
            } else {
                offset = (rpp * page) - rpp;
            }

            if (orden == null) {
                oPreparedStatement = oConnection.prepareStatement("SELECT * FROM " + ob + " LIMIT ? OFFSET ?");
                oPreparedStatement.setInt(1, rpp);
                oPreparedStatement.setInt(2, offset);
                if (word != null) {
                    oPreparedStatement = oConnection.prepareStatement("SELECT * FROM " + ob + " WHERE " + oBean.getFieldConcat() + " LIKE CONCAT('%', ?, '%')");
                    oPreparedStatement.setString(1, word);

                }
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
                oPreparedStatement = oBean.orderSQL(orden, oPreparedStatement);
                oPreparedStatement.setInt((orden.size()), rpp);
                oPreparedStatement.setInt((orden.size() + 1), offset);
            }

            oResultSet = oPreparedStatement.executeQuery();

            while (oResultSet.next()) {
                oBean = BeanFactory.getBean(ob);
                oBean = oBean.fill(oResultSet, oConnection, ConfigurationSettings.spread);
                listaBean.add(oBean);
            }
        } catch (Exception ex) {
            String msg = this.getClass().getName() + " ob: " + ob + "; insert method ";
            throw new Exception(msg, ex);
        } finally {
            if (oResultSet != null) {
                oResultSet.close();
            }
            if (oPreparedStatement != null) {
                oPreparedStatement.close();
            }
        }
        return listaBean;
    }

    @Override
    public Integer insert(BeanInterface oBeanParam) throws Exception {
        BeanInterface oBean = BeanFactory.getBean(ob);
        PreparedStatement oPreparedStatement = null;
        ResultSet oResultSet = null;
        int iResult = 0;
        try {
            String strsql = "INSERT INTO " + ob + oBean.getFieldInsert();
            oPreparedStatement = oConnection.prepareStatement(strsql, Statement.RETURN_GENERATED_KEYS);
            oPreparedStatement = oBean.setFieldInsert(oBeanParam, oPreparedStatement);
            iResult = oPreparedStatement.executeUpdate();
            oResultSet = oPreparedStatement.getGeneratedKeys(); 
            oResultSet.next();    
            iResult = oResultSet.getInt(1);    
        } catch (Exception ex) {
            String msg = this.getClass().getName() + " ob: " + ob + "; insert method ";
            throw new Exception(msg, ex);
        } finally {
            if (oResultSet != null) {
                    oResultSet.close();
            }
            if (oPreparedStatement != null) {
                oPreparedStatement.close();
            }
        }
        return iResult;
    }

    @Override
    public Integer remove(int id) throws Exception {
        PreparedStatement oPreparedStatement = null;
        int iResult = 0;
        try {
            String strSQL = "DELETE FROM " + ob + " WHERE id=?";
            oPreparedStatement = oConnection.prepareStatement(strSQL, Statement.RETURN_GENERATED_KEYS);
            oPreparedStatement.setInt(1, id);
            iResult = oPreparedStatement.executeUpdate();
        } catch (Exception ex) {
            String msg = this.getClass().getName() + " ob: " + ob + "; remove method ";
            throw new Exception(msg, ex);
        } finally {
            if (oPreparedStatement != null) {
                oPreparedStatement.close();
            }
        }
        return iResult;
    }

    @Override
    public Integer update(BeanInterface oBeanParam) throws Exception {
        BeanInterface oBean = BeanFactory.getBean(ob);
        PreparedStatement oPreparedStatement = null;
        int iResult = 0;
        try {
            String strSQL = "UPDATE " + ob + " SET " + oBean.getFieldUpdate() + " WHERE id = ?";
            oPreparedStatement = oConnection.prepareStatement(strSQL, Statement.RETURN_GENERATED_KEYS);
            oPreparedStatement = oBean.setFieldUpdate(oBeanParam, oPreparedStatement);
            iResult = oPreparedStatement.executeUpdate();
        } catch (Exception ex) {
            String msg = this.getClass().getName() + " ob: " + ob + "; update method ";
            throw new Exception(msg, ex);
        } finally {
            if (oPreparedStatement != null) {
                oPreparedStatement.close();
            }
        }
        return iResult;
    }

}
