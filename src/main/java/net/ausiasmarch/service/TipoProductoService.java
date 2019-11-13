package net.ausiasmarch.service;

import javax.servlet.http.HttpServletRequest;

public class TipoProductoService extends GenericService {

	HttpServletRequest oRequest = null;
//	String[] frasesInicio = { "El fin de la estructura ", "La agrupacion logica ", "El objetivo conjunto ",
//			"Una dinámica apropiada " };
//	String[] frasesMitad = { "dirige los objetivos ", "garantiza el deseo ", "mejora la capacidad ",
//			"recupera el concepto " };
//	String[] frasesFinal = { "de la reestructuracion requerida. ", "en la aplicación. ",
//			"por sus innumerables beneficios. ", "contra la inficiencia. " };

	public TipoProductoService(HttpServletRequest oRequest) {
		this.oRequest = oRequest;
	}

//	public String fill() throws SQLException {
//		ConnectionInterface oConnectionImplementation = ConnectionFactory
//				.getConnection(ConnectionSettings.connectionPool);
//		Connection oConnection = oConnectionImplementation.newConnection();
//		TipoProductoDao oTipoProductoDao = new TipoProductoDao(oConnection);
//		Gson oGson = GsonFactory.getGson();
//		Date date1 = new GregorianCalendar(2014, Calendar.JANUARY, 1).getTime();
//		Date date2 = new GregorianCalendar(2019, Calendar.DECEMBER, 31).getTime();
//		int numTipoProducto = Integer.parseInt(oRequest.getParameter("number"));
//		for (int i = 0; i < numTipoProducto; i++) {
//			TipoProductoBean oTipoProductoBean = new TipoProductoBean();
//			Date randomDate = new Date(ThreadLocalRandom.current().nextLong(date1.getTime(), date2.getTime()));
//			oTipoProductoBean.setTitulo(generaTexto(1));
//			oTipoProductoBean.setCuerpo(generaTexto(5));
//			oTipoProductoBean.setEtiquetas(generaTexto(1));
//			oTipoProductoBean.setFecha(randomDate);
//			oTipoProductoDao.insert(oTipoProductoBean);
//		}
//		ResponseBean oResponseBean = new ResponseBean(200, "Insertados los registros con exito");
//		if (oConnection != null) {
//			oConnection.close();
//		}
//		if (oConnectionImplementation != null) {
//			oConnectionImplementation.disposeConnection();
//		}
//		return oGson.toJson(oResponseBean);
//	}

//	private String generaTexto(int longitud) {
//		String fraseRandom = "";
//		for (int i = 0; i < longitud; i++) {
//			fraseRandom += frasesInicio[(int) (Math.random() * frasesInicio.length) + 0];
//			fraseRandom += frasesMitad[(int) (Math.random() * frasesMitad.length) + 0];
//			fraseRandom += frasesFinal[(int) (Math.random() * frasesFinal.length) + 0];
//		}
//		return fraseRandom;
//	}
}
