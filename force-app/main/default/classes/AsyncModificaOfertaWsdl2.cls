//Generated by wsdl2apex

public class AsyncModificaOfertaWsdl2 {
    public class ModificaOfertaResponse_elementFuture extends System.WebServiceCalloutFuture {
        public ModificaOfertaWsdl2.WSResponse getValue() {
            ModificaOfertaWsdl2.ModificaOfertaResponse_element response = (ModificaOfertaWsdl2.ModificaOfertaResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.ModificaOfertaResult;
        }
    }
    public class AsyncServModificaOfertaSoap {
        public String endpoint_x = 'http://172.28.0.49:7800/ModificaOferta.asmx';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://tempuri.org/', 'ModificaOfertaWsdl2'};
        public AsyncModificaOfertaWsdl2.ModificaOfertaResponse_elementFuture beginModificaOferta(System.Continuation continuation,ModificaOfertaWsdl2.MDLOffer offerS,ModificaOfertaWsdl2.MDLAccount accountS,ModificaOfertaWsdl2.MDLProject projectS) {
            ModificaOfertaWsdl2.ModificaOferta_element request_x = new ModificaOfertaWsdl2.ModificaOferta_element();
            request_x.offerS = offerS;
            request_x.accountS = accountS;
            request_x.projectS = projectS;
            return (AsyncModificaOfertaWsdl2.ModificaOfertaResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncModificaOfertaWsdl2.ModificaOfertaResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://tempuri.org/ModificaOferta',
              'http://tempuri.org/',
              'ModificaOferta',
              'http://tempuri.org/',
              'ModificaOfertaResponse',
              'ModificaOfertaWsdl2.ModificaOfertaResponse_element'}
            );
        }
    }
}