package net.ausiasmarch.service.specificservice_2;

import com.google.gson.Gson;
import java.sql.Connection;
import java.util.ArrayList;
import net.ausiasmarch.service.genericservice.GenericService;
import javax.servlet.http.HttpServletRequest;
import net.ausiasmarch.connection.ConnectionInterface;
import net.ausiasmarch.dao.daointerface.DaoInterface;
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

}
