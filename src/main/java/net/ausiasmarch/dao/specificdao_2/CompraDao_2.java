package net.ausiasmarch.dao.specificdao_2;

import net.ausiasmarch.dao.daointerface.DaoInterface;
import java.sql.Connection;
import java.util.ArrayList;
import net.ausiasmarch.bean.BeanInterface;
import net.ausiasmarch.bean.UsuarioBean;
import net.ausiasmarch.dao.genericdao.GenericDao;

public class CompraDao_2 extends GenericDao implements DaoInterface {

    public CompraDao_2(Connection oConnection, String ob,UsuarioBean oUsuarioBeanSession) {
        super(oConnection, "compra", oUsuarioBeanSession);
    }
    
     @Override
    public BeanInterface get(int id) throws Exception {
        strSQL += " AND WHERE factura_id=" + id;
        return super.get(id);
    }
    
    @Override
    public Integer getCount(Integer id, String filter) throws Exception {
        strCountSQL += " AND WHERE factura_id=" + id;
        return super.getCount(id, filter);
    }

    @Override
    public ArrayList<BeanInterface> getPage(int page, int rpp, String orden, String direccion, String word, Integer id, String filter) throws Exception {
        //strSQL += " AND WHERE factura_id = " + id;
        strSQL = "SELECT * FROM compra "
                + "INNER JOIN factura ON "
                + "factura.id = compra.factura_id "
                + "INNER JOIN usuario "
                + "WHERE factura_id = " + id +" "
                + "AND usuario_id = " + oUsuarioBeanSession.getId();
        return super.getPage(page, rpp, orden, direccion, word, id, filter);
    }

    
    @Override
    public Integer remove(int id) throws Exception {
        throw new Exception("Error en Dao remove de " + ob + ": No autorizado");
    }

    @Override
    public Integer update(BeanInterface oBeanParam) throws Exception {
        throw new Exception("Error en Dao update de " + ob + ": No autorizado");
    }

    @Override
    public Integer insert(BeanInterface oBeanParam) throws Exception {
        throw new Exception("Error en Dao insert de " + ob + ": No autorizado");
    }
    
}
