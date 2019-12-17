package net.ausiasmarch.service.serviceinterface;

import java.sql.SQLException;
import net.ausiasmarch.exceptions.MyException;

public interface ServiceInterface {

    public String get() throws MyException, SQLException;

    public String getCount() throws MyException, SQLException;

    public String getPage() throws MyException, SQLException;

    public String insert() throws MyException, SQLException;

    public String remove() throws MyException, SQLException;

    public String update() throws MyException, SQLException;
    
}
