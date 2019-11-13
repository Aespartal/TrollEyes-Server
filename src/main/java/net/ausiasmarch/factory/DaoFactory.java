package net.ausiasmarch.factory;

import java.sql.Connection;
import net.ausiasmarch.dao.DaoInterface;
import net.ausiasmarch.dao.GenericDao;

public class DaoFactory {
      public static DaoInterface getDao(String ob,Connection oConnection) {
        DaoInterface oDao = null;
        switch (ob) {
            case "producto":
                oDao = new GenericDao(ob, oConnection);
                break;
                case "factura":
                oDao = new GenericDao(ob, oConnection);
                break;
                case "compra":
                oDao = new GenericDao(ob, oConnection);
                break;
                case "tipo_producto":
                oDao = new GenericDao(ob, oConnection);
                break;
                case "tipo_usuario":
                oDao = new GenericDao(ob, oConnection);
                break;
                case "usuario":
                oDao = new GenericDao(ob, oConnection);
                break;
        }
        return oDao ;
    }
}
