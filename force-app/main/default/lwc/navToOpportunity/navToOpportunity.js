import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class navToOpportunityPages extends NavigationMixin(LightningElement) {

navigateToOpportunity(){
this[NavigationMixin.Navigate]({
    type:'standard__objectPage',
    attributes:{
        objectApiName:'Opportunity',
        actionName:'new'
    }
})
}
navigateToOpportunityRecords(){
    this[NavigationMixin.Navigate]({
        type:'standard__objectPage',
        attributes:{
            objectApiName:'Opportunity',
            actionName:'list'
        }
    })
}
}