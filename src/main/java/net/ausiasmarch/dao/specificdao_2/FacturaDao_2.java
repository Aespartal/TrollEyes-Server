package net.ausiasmarch.dao.specificdao_2;

import net.ausiasmarch.dao.daointerface.DaoInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import net.ausiasmarch.bean.FacturaBean;
import net.ausiasmarch.bean.UsuarioBean;
import net.ausiasmarch.dao.genericdao.GenericDao;
import net.ausiasmarch.setting.ConfigurationSettings;

public class FacturaDao_2 extends GenericDao implements DaoInterface {

    public FacturaDao_2(Connection oConnection, String ob, UsuarioBean oUsuarioBeanSession) {
        super(oConnection, "factura", oUsuarioBeanSession);
        this.ob = ob;
    }

    public int getCountFactureUser(int idusuario) throws Exception {
        if (idusuario == oUsuarioBeanSession.getId()) {
            String strSQL = "SELECT COUNT(id) FROM " + ob + " WHERE usuario_id=? ";
            int res = 0;
            ResultSet oResultSet = null;
            PreparedStatement oPreparedStatement = null;
            try {
                oPreparedStatement = oConnection.prepareStatement(strSQL);
                oPreparedStatement.setInt(1, idusuario);
                oResultSet = oPreparedStatement.executeQuery();
                if (oResultSet.next()) {
                    res = oResultSet.getInt(1);
                }
            } catch (SQLException ex) {
                String msg = this.getClass().getName() + " ob: " + ob + "; getcountFacturaUser method ";
                throw new Exception(msg, ex);
            } finally {
                if (oResultSet != null) {
                    oResultSet.close();
                }
                if (oPreparedStatement != null) {
                    oPreparedStatement.close();
                }
            }
            return res;
        } else {
            throw new Exception("No autorizado " + ob);
        }
    }

    public ArrayList<FacturaBean> getPageFactureUser(int page, int rpp, String orden, String direccion, int idUsuario) throws Exception {
        if (idUsuario == oUsuarioBeanSession.getId()) {
            PreparedStatement oPreparedStatement = null;
            ResultSet oResultSet = null;
            ArrayList<FacturaBean> listaBean = new ArrayList<>();
            try {
                int offset;
                if (page == 1) {
                    offset = 0;
                } else {
                    offset = (rpp * page) - rpp;
                }
                int numparam = 0;
                //Condicion de ordenar
                strSQL = "SELECT * FROM " + ob + " WHERE usuario_id=? ";
                if (orden == null) {
                    strSQL += " LIMIT ? OFFSET ?";
                    oPreparedStatement = oConnection.prepareStatement(strSQL);
                    oPreparedStatement.setInt(++numparam, idUsuario);
                    oPreparedStatement.setInt(++numparam, rpp);
                    oPreparedStatement.setInt(++numparam, offset);
                } else {
                    strSQL += " ORDER BY ? ";
                    if (direccion.equalsIgnoreCase("asc")) {
                        strSQL += "ASC ";
                    } else if (direccion.equalsIgnoreCase("desc")) {
                        strSQL += "DESC ";
                    }
                    strSQL += "LIMIT ? OFFSET ?";
                    oPreparedStatement = oConnection.prepareStatement(strSQL);
                    oPreparedStatement.setInt(++numparam, idUsuario);
                    oPreparedStatement.setString(++numparam, orden);
                    oPreparedStatement.setInt(++numparam, rpp);
                    oPreparedStatement.setInt(++numparam, offset);
                }

                oResultSet = oPreparedStatement.executeQuery();

                while (oResultSet.next()) {
                    FacturaBean oFacturaBean = new FacturaBean();
                    oFacturaBean.fill(oResultSet, oConnection, ConfigurationSettings.spread, oUsuarioBeanSession);
                    listaBean.add(oFacturaBean);
                }
            } catch (Exception ex) {
                String msg = this.getClass().getName() + " ob: " + ob + "; getPage method ";
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
        } else {
            throw new Exception("No autorizado " + ob);
        }
    }
}
