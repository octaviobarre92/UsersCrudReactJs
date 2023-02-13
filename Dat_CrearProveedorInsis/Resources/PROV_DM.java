import java.sql.SQLException;
import java.sql.Connection;

public class PROV_DM
{

  /* connection management */
  protected Connection __onn = null;
  protected javax.sql.DataSource __dataSource = null;
 public void setDataSource(javax.sql.DataSource dataSource) throws SQLException
  { release(); __dataSource = dataSource; }
 public void setDataSourceLocation(String dataSourceLocation) throws SQLException {
 javax.sql.DataSource dataSource;
 try {
 Class cls = Class.forName("javax.naming.InitialContext");
 Object ctx = cls.newInstance();
 java.lang.reflect.Method meth = cls.getMethod("lookup", new Class[]{String.class});
 dataSource = (javax.sql.DataSource) meth.invoke(ctx, new Object[]{"java:comp/env/" + dataSourceLocation});
 setDataSource(dataSource);
 } catch (Exception e) {
 throw new java.sql.SQLException("Error initializing DataSource at " + dataSourceLocation + ": " + e.getMessage());
 }
  }
 public Connection getConnection() throws SQLException
 { 
    if (__onn!=null) return __onn;
  else if (__dataSource!=null) __onn= __dataSource.getConnection(); 
  return __onn; 
   } 
 public void release() throws SQLException { 
    __onn = null;
    __dataSource = null;
  }

 public void closeConnection(){
 if (__dataSource!=null) {
 try { if (__onn!=null) { __onn.close(); } } catch (java.sql.SQLException e) {}
 __onn=null;
 }
  }
 public void setConnection(java.sql.Connection conn) throws SQLException
  { __onn = conn; }

 /* constructors */
 public PROV_DM() throws SQLException
  {  }
 public PROV_DM(Connection c) throws SQLException
 {__onn = c;  }
 public PROV_DM(javax.sql.DataSource ds) throws SQLException { __dataSource = ds; }

/* Unable to generate method "insertProvider"
   because it uses unsupported types: PIO_ERR INSIS_NTW_V10.SRVERR

  public boolean insertProvider (
    java.math.BigDecimal PI_MAN_ID,
    java.math.BigDecimal PO_PROVIDER_ID[],
    <unsupported type> PIO_ERR[])
  throws java.sql.SQLException
  {
    java.sql.Connection __sJT_cc = null;
 boolean __jPt_result=false;
    oracle.jdbc.OracleCallableStatement __sJT_st=null;
 try {
    __sJT_cc = getConnection();
 __sJT_st = (oracle.jdbc.OracleCallableStatement) __sJT_cc.prepareCall("BEGIN :1 := BPEL_CREARPROVEEDORINSIS.prov_dm$insert_provider(:2 ,:3 ,:4 ); END;");
    __sJT_st.registerOutParameter(1, -7);
 if (PI_MAN_ID==null) __sJT_st.setNull(2, 2); else __sJT_st.setBigDecimal(2, PI_MAN_ID);
    __sJT_st.registerOutParameter(3, 2);
    __sJT_st.registerOutParameter(4, 1997);
 if (PIO_ERR[0]==null) __sJT_st.setNull(4, 1997); else __sJT_st.setObject(4, PIO_ERR[0]);
    __sJT_st.executeUpdate();
    __jPt_result = (boolean) __sJT_st.getBoolean(1);
 PO_PROVIDER_ID[0] = (java.math.BigDecimal) __sJT_st.getBigDecimal(3);
 PIO_ERR[0] = (<unsupported type>) __sJT_st.getObject(4);
    try { __sJT_st.close(); } catch (Exception e) {}
 } catch(java.sql.SQLException _err) {
   try {
 __sJT_st.close();
 if (__dataSource==null) throw _err;
    __sJT_cc = getConnection();
 __sJT_st = (oracle.jdbc.OracleCallableStatement) __sJT_cc.prepareCall("BEGIN :1 := BPEL_CREARPROVEEDORINSIS.prov_dm$insert_provider(:2 ,:3 ,:4 ); END;");
    __sJT_st.registerOutParameter(1, -7);
 if (PI_MAN_ID==null) __sJT_st.setNull(2, 2); else __sJT_st.setBigDecimal(2, PI_MAN_ID);
    __sJT_st.registerOutParameter(3, 2);
    __sJT_st.registerOutParameter(4, 1997);
 if (PIO_ERR[0]==null) __sJT_st.setNull(4, 1997); else __sJT_st.setObject(4, PIO_ERR[0]);
    __sJT_st.executeUpdate();
    __jPt_result = (boolean) __sJT_st.getBoolean(1);
 PO_PROVIDER_ID[0] = (java.math.BigDecimal) __sJT_st.getBigDecimal(3);
 PIO_ERR[0] = (<unsupported type>) __sJT_st.getObject(4);
    try { __sJT_st.close(); } catch (Exception e) {}
   } catch (java.sql.SQLException _err2) { 
      __sJT_st.close();
     throw _err; 
 }
 }
    return __jPt_result;
  }
*/
}
