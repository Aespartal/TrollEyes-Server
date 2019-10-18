package net.ausiasmarch.service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

import net.ausiasmarch.bean.PostBean;
import net.ausiasmarch.bean.ResponseBean;
import net.ausiasmarch.connection.ConnectionInterface;
import net.ausiasmarch.dao.PostDao;
import net.ausiasmarch.factory.ConnectionFactory;
import net.ausiasmarch.setting.ConnectionSettings;

public class PostService {

    HttpServletRequest oRequest = null;

    public PostService(HttpServletRequest oRequest) {
        this.oRequest = oRequest;
    }


      public String getPage() throws SQLException {
        ConnectionInterface oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
        Connection oConection = oConnectionImplementation.newConnection();
        int pagina = Integer.parseInt(oRequest.getParameter("page"));
        int numeroRegistros = Integer.parseInt(oRequest.getParameter("limit"));
          PostDao oPostDao = new PostDao(oConection);
        ArrayList<PostBean> oPostBeanList = oPostDao.getPage(pagina,numeroRegistros);
        Gson gson = new GsonBuilder().setDateFormat("dd/mm/yyyy HH:mm").create();
        Gson oGson = gson;
        String strJson = oGson.toJson(oPostBeanList);
        oConnectionImplementation.disposeConnection();
        return "{\"status\":200,\"response\":" + strJson + "}";
      }

    public String update() throws SQLException {
        ConnectionInterface oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
        Connection oConection = oConnectionImplementation.newConnection();
        PostBean oPostBean = new PostBean();
        Gson oGson = new Gson();
        oPostBean = oGson.fromJson(oRequest.getParameter("data"), PostBean.class);
        PostDao oPostDao = new PostDao(oConection);
        ResponseBean oResponseBean;
        if (oPostDao.update(oPostBean) == 0) {
            oResponseBean = new ResponseBean(500, "KO");
        } else {
            oResponseBean = new ResponseBean(200, "OK");
        };
        oConnectionImplementation.disposeConnection();
        return oGson.toJson(oResponseBean);
    }
    
    public String getAll() throws SQLException {
        ConnectionInterface oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
        Connection oConection = oConnectionImplementation.newConnection();
        PostDao oPostDao = new PostDao(oConection);
        Gson oGson = new Gson();
        String message = "";
        
        //GsonHelper gh = new GsonHelper();
        
        oGson = new GsonBuilder().setDateFormat("dd/MMM/yyyy HH:mm").create();
        List<PostBean> listaPostBean = oPostDao.getall();
            if(listaPostBean==null){
                message = "\"La lista está vacia\"";
            } else {
                //oGson = gh.getGson();
                message = oGson.toJson(listaPostBean);
            }
        oConnectionImplementation.disposeConnection();
        return "{\"status\":200,\"response\":" + message + "}";
    }

}
