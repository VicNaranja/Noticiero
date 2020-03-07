import { LightningElement,track,wire,api  } from 'lwc';
import getNoticias from '@salesforce/apex/ElCorreoController.getNoticias';
import getNoticia from '@salesforce/apex/ElCorreoController.getNoticia';

export default class MiCorreoLWC extends LightningElement {

    @track origen = ''; //Identifica el componente que selecciono la noticia (Pendiente ver si hace falta en LWC)
    
    seccionSeleccionada = 'ElCorreo'; //Valor por defecto
    @track seccionIberostar;
    @track seccionElCorreo;

    @track noticias = []; //Listado de noticias recuperado
    @track noticiaSeleccionada = {}; //Noticia seleccionada
    @track noticiaCargada;
    @track error;
    
    @api //propiedades publicas para establecer la seccion
    get seccion() {
        return this.noticia;
    }

    set seccion(value) {
       console.log('seccion establecida::' + value);

       this.seccionSeleccionada = value;
       this.seccionIberostar = value === 'Iberostar' ? true:false;
       this.seccionElCorreo = value === 'ElCorreo' ? true:false;
    }
    

    //funcion init
    connectedCallback()
    {
        console.log('seccionSeleccionada::' + this.seccionSeleccionada);
       //Se invoca al metodo de forma tradicional
       //De esta forma no es necesario que el metodo sea cacheable
        getNoticias({section: this.seccionSeleccionada})
                    .then(result => {     
                        console.log(JSON.stringify(result));                   
                        this.noticias = result; //No hace falta acceder al atributo data
                    })
                    .catch(error => {
                        this.error = error;
                    });
    }

    //Se puede vincular la propiedad a la funcion - El resultado estara en el atributo data
    //De esta forma el metodo apex tiene que ser cacheable
    //@wire(getNoticias , { section: '$seccionSeleccionada' })
    //noticias

    /* Wire como metodo autoinvocable   
    @wire(getNoticias , { section: '$seccionSeleccionada' })
    recuperarNoticias({ error, data }) {
        console.log('recuperarNoticias :' + data);
        console.log('recuperarNoticias :' + JSON.stringify(error));
        if (data) {
            this.noticias = data;           
            console.log('Noticias :' + JSON.stringify(this.noticias) );
        }
    }
    */

   noticiaPulsada(evt)
   {
        console.log('Padre recibe evento:' + JSON.stringify(evt));
        getNoticia({articulo: evt.detail, seccion:this.seccionSeleccionada})
        .then(result => {     
            console.log('resultadoNoticia:' + JSON.stringify(result));                   
            this.noticiaSeleccionada = result; //No hace falta acceder al atributo data
            this.noticiaCargada = true;
            console.log('img:' + result.UrlImagenGrande);
            //habilitamos el boton de atras
            var menu = this.template.querySelector('.TituloApp .menu');
            menu.classList.toggle('oculto');
        })
        .catch(error => {
            console.log('error:' + error);
            this.error = error;
        });
   }

   backButtonPress()
   {
       //ocultamos el boton
       var menu = this.template.querySelector('.TituloApp .menu');
       menu.classList.toggle('oculto');
       //borramos la noticia seleccionada
       this.noticiaSeleccionada = {};
       //indicamos a la vista que la noticia ya no esta cargada
       this.noticiaCargada = false;
   }

}