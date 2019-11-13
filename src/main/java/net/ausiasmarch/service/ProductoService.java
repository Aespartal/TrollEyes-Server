package net.ausiasmarch.service;

import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DecimalFormat;
import javax.servlet.http.HttpServletRequest;
import net.ausiasmarch.bean.BeanInterface;
import net.ausiasmarch.bean.ProductoBean;
import net.ausiasmarch.bean.ResponseBean;
import net.ausiasmarch.connection.ConnectionInterface;
import net.ausiasmarch.dao.DaoInterface;
import net.ausiasmarch.dao.ProductoDao;
import net.ausiasmarch.factory.BeanFactory;
import net.ausiasmarch.factory.ConnectionFactory;
import net.ausiasmarch.factory.DaoFactory;
import net.ausiasmarch.factory.GsonFactory;
import net.ausiasmarch.setting.ConnectionSettings;

public class ProductoService extends GenericService {

	HttpServletRequest oRequest = null;
	String[] frasesInicio = { "Maquina de ", "Interruptor para ", "Libro de ",
			"Bebida de  " };
//	String[] frasesMitad = { "dirige los objetivos ", "garantiza el deseo ", "mejora la capacidad ",
//			"recupera el concepto " };
	String[] frasesFinal = { "emparejar. ", "montar tubos. ",
			"manzana. ", "dientes. " };

	public ProductoService(HttpServletRequest oRequest) {
		this.oRequest = oRequest;
	}

	public String fill() throws SQLException {
		ConnectionInterface oConnectionImplementation = ConnectionFactory
				.getConnection(ConnectionSettings.connectionPool);
		Connection oConnection = oConnectionImplementation.newConnection();
		DaoInterface oDao = DaoFactory.getDao(ob, oConnection);
		Gson oGson = GsonFactory.getGson();
//		Date date1 = new GregorianCalendar(2014, Calendar.JANUARY, 1).getTime();
//		Date date2 = new GregorianCalendar(2019, Calendar.DECEMBER, 31).getTime();
		int numProd = Integer.parseInt(oRequest.getParameter("number"));
		for (int i = 0; i < numProd; i++) {
			BeanInterface oBean = BeanFactory.getBean(ob);
//			Date randomDate = new Date(ThreadLocalRandom.current().nextLong(date1.getTime(), date2.getTime()));
			 int numAleatorio=(int)Math.floor(Math.random()*(100000-999999)+999999);
			 int numAleatorio1=(int)Math.floor(Math.random()*(0-999)+999);
			 double numAleatorio2 =(double)Math.random()*(0-999)+999;
			 DecimalFormat format2 = new DecimalFormat("#,00");
			double precioAleatorio = Double.parseDouble(format2.format(numAleatorio2));
			int alTipoProducto_id = (int) Math.floor(Math.random()*12)+1;
			
			
			oBean.setCodigo(numAleatorio+"");
			oBean.setExistencias(numAleatorio1);
			oBean.setPrecio(precioAleatorio);
			oBean.setImagen("link a una imagen");
			oBean.setDescripcion(generaTexto(1));
			oBean.setTipo_producto_id(alTipoProducto_id);
			oDao.insert(oBean);
		}
		ResponseBean oResponseBean = new ResponseBean(200, "Insertados los registros con exito");
		if (oConnection != null) {
			oConnection.close();
		}
		if (oConnectionImplementation != null) {
			oConnectionImplementation.disposeConnection();
		}
		return oGson.toJson(oResponseBean);
	}

	private String generaTexto(int longitud) {
		String fraseRandom = "";
		for (int i = 0; i < longitud; i++) {
			fraseRandom += frasesInicio[(int) (Math.random() * frasesInicio.length) + 0];
//			fraseRandom += frasesMitad[(int) (Math.random() * frasesMitad.length) + 0];
			fraseRandom += frasesFinal[(int) (Math.random() * frasesFinal.length) + 0];
		}
		return fraseRandom;
	}
}
