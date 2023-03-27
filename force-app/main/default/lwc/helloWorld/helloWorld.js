import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
    greeting = 'World2';
  changeHandler(event) {
const abc = event.target.value;
if(abc.endsWith(' ')){
 this.greeting = event.target.value;
  }
}
}