package net.ausiasmarch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import net.ausiasmarch.bean.FacturaBean;

public class FacturaDao extends GenericDao implements DaoInterface {

    public FacturaDao(Connection oConnection) {
        super(oConnection, "factura");
    }
    
}
