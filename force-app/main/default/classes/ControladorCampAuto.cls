public with sharing class ControladorCampAuto {
	public static Map<String, string> GetCodigosPromo(string codigoPromocionalCampanya, Set<string> listaEmailsAcc, Boolean esTest)
    {
        System.Debug('esTest: ' + esTest);
        INN.CrearBonos_element request_x;
        if(codigoPromocionalCampanya == null)
        {
            return null;
        }
        
        string msg_error = '';
        
        try
        {
            Map<String, string> mResul = new Map<String, string>();
            INN.wsIbsPromocionesCRMSoap oInnCA = new INN.wsIbsPromocionesCRMSoap();
            oInnCA.timeout_x = 20000;
            INN.ArrayOfString listaDirecciones = new INN.ArrayOfString();
            listaDirecciones.string_x = new List<String>();
            integer size = listaEmailsAcc.size();
            
            for(String email_Acc : listaEmailsAcc)
            {
                listaDirecciones.string_x.add(email_Acc);
            }
            request_x = crearBonos(Integer.ValueOf(codigoPromocionalCampanya), listaDirecciones, esTest);
            System.Debug('request_x: ' + request_x);
            
            INN.CrearBonosResult_element res = oInnCA.CrearBonos(Integer.ValueOf(codigoPromocionalCampanya), listaDirecciones, esTest);
            System.Debug('response: ' + res);
            if(res != null && res.DocumentElement.BONOSEMAIL != null)
            {
                for(INN.BONOSEMAIL_element it : res.DocumentElement.BONOSEMAIL)
                {
                    if(!mResul.ContainsKey(it.EMAIL))
                    {
                        mResul.put(it.EMAIL, it.PRBOCODIPROMO);
                    }
                }   
                System.debug('Test - ' + mResul + ' ' + res.DocumentElement.BONOSEMAIL);
                return mResul;
            }
            else
            {
                return null;
            }
        }
        catch (Exception ex)
        {
            System.debug('********************************************');
            System.debug('********************************************');
            System.debug('********************************************');
            System.debug('********************************************');
            
            msg_error = ' Para codigoPromocionalCampanya ->' + codigoPromocionalCampanya + ' se ha producido Exception->' + ex.getMessage() + '\n';
            msg_error = msg_error + ' Correos Afectados:\n';
            
            for(string cad: listaEmailsAcc)
            {
                System.debug('\n correo ->' + cad);
                msg_error = msg_error + '\n correo ->' + cad;
            }
            msg_error += '\n Cod. Promocional Campaña ->' + codigoPromocionalCampanya;
            msg_error += '\n El request construido es: ' + request_x;
            
            sendEmailError('ERROR GetCodigosPromo', msg_error);
        }
        return null;
    }

    private static INN.CrearBonos_element crearBonos(Integer promocodi, INN.ArrayOfString dsDirecciones, Boolean test)
    {
        System.Debug('test: ' + test);
        INN.CrearBonos_element request_x = new INN.CrearBonos_element();
        INN.CrearBonosResponse_element response_x;
        request_x.promocodi = promocodi;
        request_x.dsDirecciones = dsDirecciones;
        Map<String, INN.CrearBonosResponse_element> response_map_x = new Map<String, INN.CrearBonosResponse_element>();
        response_map_x.put('response_x', response_x);
        
        return request_x;
    }
    
    public static void sendEmailError(string subject, string txt_evento)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {'soporte-iberostar@nts-solutions.com','vsaez@nts-solutions.com'});
        mail.setReplyTo('soporte-iberostar@nts-solutions.com');
        mail.setSenderDisplayName('ERROR ControladorCampAuto');  
        mail.setSubject(subject);
        mail.setPlainTextBody(txt_evento);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}