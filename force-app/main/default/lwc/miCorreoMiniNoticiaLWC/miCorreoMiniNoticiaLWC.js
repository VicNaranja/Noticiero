import { LightningElement,api,track  } from 'lwc';

export default class MiCorreoMiniNoticiaLWC extends LightningElement {

    //No es obligatorio pero conviene indicar que eventos lanzara este componenete

    @track noticia; //La noticia nos la pasa el compomente padre. Este componenete solo la pinta.

    
    @api //propiedades publicas para establecer la noticia
    get noticia() {
        return this.noticia;
    }

    set noticia(value) {
       this.noticia = value;
    }

    noticiaSeleccionada(evt)
    {        
        console.log('evt:' +  JSON.stringify(evt.detail));
        console.log('noticia' + this.noticia.Titular)
        const event = new CustomEvent('noticiaseleccionada', {
            detail: this.noticia.Enlace
        });
        // lanzamos el evento para que lo trate el padre
        this.dispatchEvent(event);

    }


}