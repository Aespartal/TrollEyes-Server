package net.ausiasmarch.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import net.ausiasmarch.bean.BeanInterface;

public interface DaoInterface {

    BeanInterface get(int id) throws Exception;

    int getCount() throws Exception;

    ArrayList getPage(int page, int rpp, List<String> orden, String word) throws Exception;

    Integer insert(BeanInterface oBean) throws Exception;

    Integer remove(int id) throws Exception;

    Integer update(BeanInterface oBean) throws Exception;

}
