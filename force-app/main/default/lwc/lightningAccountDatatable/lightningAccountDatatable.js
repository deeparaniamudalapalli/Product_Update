import { LightningElement,track, wire} from 'lwc';
import getAccountRecList from '@salesforce/apex/AccountHelper.getAccountList';

export default class LightningAccountDatatable extends LightningElement {
@track columns = [{
    label: 'Account name',
    fieldName: 'Name',
    type:'Name',
    sortable: true
},
{
    label: 'Type',
    fieldName: 'Type',
    type:'Picklist',
    sortable: true

},
{
    label:'Rating',
    fieldName: 'Rating',
    type:'Picklist',
    sortable: true

},
{
    label:'AnnualRevenue',
    fieldName: 'AnnualRevenue	',
    type:'Currency',
    sortable: true
}

];
@track error;
@track accList;
@wire(getAccountRecList)
wiredAccounts({error,data}) {
    if(data) {
        this.accList = data;
 } else if(error){
    this.error=error;
 }
}
}