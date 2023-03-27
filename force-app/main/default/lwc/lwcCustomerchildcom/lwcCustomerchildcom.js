import { LightningElement,api,track} from 'lwc';

export default class LwcCustomerchildcom extends LightningElement {
     @api rec = {
        Name: '',
        Phone: '',
        Industry: ''
    }

 handleChangeName(event){
        this.rec.Name = event.target.value;
        console.log(this.rec.Name);
    }
    handleClick(event){
        console.log('dispatched from child to parent component');
        this.dispatchEvent(new CustomEvent('next', {detail: this.rec}));
        
    }
}