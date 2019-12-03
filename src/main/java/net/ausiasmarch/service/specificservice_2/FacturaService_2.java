package net.ausiasmarch.service.specificservice_2;

import com.google.gson.Gson;
import java.sql.Connection;
import java.util.ArrayList;
import net.ausiasmarch.service.genericservice.GenericService;
import javax.servlet.http.HttpServletRequest;
import net.ausiasmarch.bean.FacturaBean;
import net.ausiasmarch.bean.ResponseBean;
import net.ausiasmarch.connection.ConnectionInterface;
import net.ausiasmarch.dao.specificdao_2.FacturaDao_2;
import net.ausiasmarch.factory.ConnectionFactory;
import net.ausiasmarch.factory.DaoFactory;
import net.ausiasmarch.factory.GsonFactory;
import net.ausiasmarch.service.serviceinterface.ServiceInterface;
import net.ausiasmarch.setting.ConnectionSettings;

public class FacturaService_2 extends GenericService implements ServiceInterface {

    public FacturaService_2(HttpServletRequest request) {
        super(request);
        ob = oRequest.getParameter("ob");
    }

    public String getCountFactureUser() throws Exception {
        Gson oGson = GsonFactory.getGson();
        Integer iCount = null;
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        ResponseBean oResponseBean = null;
        try {
            Integer id = Integer.parseInt(oRequest.getParameter("id"));
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            FacturaDao_2 oDao = (FacturaDao_2) DaoFactory.getDao(oConnection, ob, oUsuarioBeanSession);
            iCount = oDao.getCountFactureUser(id);
            if (iCount < 0) {
                oResponseBean = new ResponseBean(500, iCount.toString());
            } else {
                oResponseBean = new ResponseBean(200, iCount.toString());
            }
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: getcount method: " + ob + " object", ex);
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

    public String getPageFactureUser() throws Exception {
        Gson oGson = GsonFactory.getGson();
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        String strJson = null;
        try {
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            //Recibir parametros
            Integer idusuario = Integer.parseInt(oRequest.getParameter("id"));
            Integer iRpp = Integer.parseInt(oRequest.getParameter("rpp"));
            Integer iPage = Integer.parseInt(oRequest.getParameter("page"));
            String orden = null;
            String direccion = null;
            if (oRequest.getParameter("order") != null && oRequest.getParameter("direccion") != null) {
                orden = oRequest.getParameter("order");
                direccion = oRequest.getParameter("direccion");
            }
            FacturaDao_2 oFacturaDao = new FacturaDao_2(oConnection, ob, oUsuarioBeanSession);
            ArrayList<FacturaBean> alBean = oFacturaDao.getPageFactureUser(iPage, iRpp, orden, direccion, idusuario);
            strJson = oGson.toJson(alBean);
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: getPageFactureUser method: " + ob + " object " + ex.getMessage(), ex);
        } finally {
            if (oConnection != null) {
                oConnection.close();
            }
            if (oConnectionImplementation != null) {
                oConnectionImplementation.disposeConnection();
            }
        }

        return "{\"status\":200,\"message\":" + strJson + "}";

    }
}
