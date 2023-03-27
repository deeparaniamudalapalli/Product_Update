import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'

export default class navToNamePages extends NavigationMixin(LightningElement){
    policytolineitem(){
    this[NavigationMixin.Navigate]({
        type:'standard__objectPage',
        attributes:{
            objectApiName:'Policy_Line_Item__c',
            actionName:'new'
        }
    })
    }
}