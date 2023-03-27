import { LightningElement ,track } from 'lwc';
import emiresult from '@salesforce/apex/EmiCalculation.emi' ;
export default class Emicalculation extends LightningElement {
@track v1;
@track v2;
 @track v3;
 @track res;

 handleChange(event){
   this.v1 = event.target.value
 }

 handleChange(event) {
    this.v2= event.target.value
  }
  handleChange(event) {
    this.v3 = event.target.value
}
calcExpr(event){
emiresult({
  LoanAmount:this.v1,
  LoanTenture:this.v2,
  InterestRate:this.v3,
})
.then(result => {
  this.res= result;
 
  })

}
}