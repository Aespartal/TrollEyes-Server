package net.ausiasmarch.factory;

import javax.servlet.http.HttpServletRequest;
import net.ausiasmarch.service.CarritoService;
import net.ausiasmarch.service.FacturaService;
import net.ausiasmarch.service.ProductoService;
import net.ausiasmarch.service.TipoProductoService;
import net.ausiasmarch.service.TipoUsuarioService;
import net.ausiasmarch.service.UsuarioService;

public class ServiceCall {

    HttpServletRequest oRequest;

    public static String executeService(HttpServletRequest oRequest) throws Exception {
        String ob = oRequest.getParameter("ob");
        String op = oRequest.getParameter("op");
        String strResult = null;
        if (ob.equalsIgnoreCase("usuario")) {
            UsuarioService oUsuarioService = new UsuarioService(oRequest);
            switch (op) {
                case "login":
                    strResult = oUsuarioService.login();
                    break;
                case "check":
                    strResult = oUsuarioService.check();
                    break;
                case "logout":
                    strResult = oUsuarioService.logout();
                    break;
                case "insert":
                    strResult = oUsuarioService.insert();
                    break;
                case "fill":
                    strResult = oUsuarioService.fill();
                    break;    
            }
        }
         if (ob.equalsIgnoreCase("tipoproducto")) {
            TipoProductoService oTipoProductoService = new TipoProductoService(oRequest);
            switch (op) {
                case "remove":
                    strResult = oTipoProductoService.remove();
                    break;
                case "get":
                    strResult = oTipoProductoService.get();
                    break;
                case "getpage":
                    strResult = oTipoProductoService.getPage();
                    break;
                case "getcount":
                    strResult = oTipoProductoService.getCount();
                    break;        
                case "insert":
                    strResult = oTipoProductoService.insert();
                    break;
                case "update":
                    strResult = oTipoProductoService.update();
                    break;     
            }
        }
         if (ob.equalsIgnoreCase("factura")) {
            FacturaService oFacturaService = new FacturaService(oRequest);
            switch (op) {
                /*
                 case "fill":
                    strResult = oCompraService.fill();
                    break;*/
                case "remove":
                    strResult = oFacturaService.remove();
                    break;
                case "get":
                    strResult = oFacturaService.get();
                    break;
                case "getpage":
                    strResult = oFacturaService.getPage();
                    break;
                case "getcount":
                    strResult = oFacturaService.getCount();
                    break;        
                case "insert":
                    strResult = oFacturaService.insert();
                    break;
                case "update":
                    strResult = oFacturaService.update();
                    break;     
            }
        }
          if (ob.equalsIgnoreCase("producto")) {
            ProductoService oProductoService = new ProductoService(oRequest);
            switch (op) {
                case "fill":
                    strResult = oProductoService.fill();
                    break;
                case "remove":
                    strResult = oProductoService.remove();
                    break;
                case "get":
                    strResult = oProductoService.get();
                    break;
                case "getpage":
                    strResult = oProductoService.getPage();
                    break;
                case "getcount":
                    strResult = oProductoService.getCount();
                    break;        
                case "insert":
                    strResult = oProductoService.insert();
                    break;
                case "update":
                    strResult = oProductoService.update();
                    break;
            }
          }
             if (ob.equalsIgnoreCase("tipousuario")) {
            TipoUsuarioService oTipoUsuarioService = new TipoUsuarioService(oRequest);
            switch (op) {
                case "remove":
                    strResult = oTipoUsuarioService.remove();
                    break;
                case "get":
                    strResult = oTipoUsuarioService.get();
                    break;
                case "getpage":
                    strResult = oTipoUsuarioService.getPage();
                    break;
                case "getcount":
                    strResult = oTipoUsuarioService.getCount();
                    break;        
                case "insert":
                    strResult = oTipoUsuarioService.insert();
                    break;
                case "update":
                    strResult = oTipoUsuarioService.update();
                    break;        
                }
             }
        if (ob.equalsIgnoreCase("carrito")) {
            CarritoService oCarritoService = new CarritoService(oRequest);
            switch (op) {
                case "add":
                    strResult = oCarritoService.add();
                    break;
                case "list":
                    strResult = oCarritoService.list();
                    break;
                case "remove":
                    strResult = oCarritoService.remove();
                    break;
                case "empty":
                    strResult = oCarritoService.empty();
                    break;
            }
        }
        return strResult;
    }
}
