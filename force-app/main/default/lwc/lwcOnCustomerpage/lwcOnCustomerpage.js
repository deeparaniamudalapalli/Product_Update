import { LightningElement , track } from 'lwc';

export default class LwcOnCustomerpage extends LightningElement {
  @track inputPhone = false;
  @track rec = {
        Name: '',
        Phone:'',
        Industry:''
    }

    
    nextInputName(event){
        console.log('start event from <c-lwc-Customerchildcom> component');
        this.rec.Name = event.detail.Name;
        console.log(`from <c-lwc-Customerchildcom> component's value: ${this.rec.Name}`);
        this.inputPhone = true;
    }
}