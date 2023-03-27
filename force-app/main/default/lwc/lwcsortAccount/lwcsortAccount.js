import { LightningElement,wire,track } from 'lwc';
import  sortAccountItem from '@salesforce/apex/AccountHelper.getAccountList';
export default class LwcsortAccount extends LightningElement {
@track columns = [
    {
        label: 'Name',
        fieldName: 'Name',
        sortable: "true"
    }, {
        label: 'Phone',
        fieldName: 'Phone',
        sortable: "true"
    }, {
        label: 'Industry',
        fieldName: 'Industry',
        type: 'Picklist',
        sortable: "true"
    }, {
        label: 'Type',
        fieldName: 'Type',
        type: 'Picklist',
        sortable: "true"
    }, {
        label: 'Website',
        fieldName: 'Website',
        type: 'URL',
        sortable: "true"
    },
];
    @track data;
    @track columns = columns;
    @track sortBy;
    @track sortDirection;
    @wire(sortAccountItem)
    accounts(result) {
        if (result.data) {
            this.data = result.data;
            this.error = undefined;


        } else if (result.error) {
            this.error = result.error;
            this.data = undefined;
        }
    }




    handleSortAccountData(event) {       
        this.sortBy = event.detail.fieldName;       
        this.sortDirection = event.detail.sortDirection;       
        this.sortAccountData(event.detail.fieldName, event.detail.sortDirection);
    }


    sortAccountData(fieldname, direction) {
        
        let parseData = JSON.parse(JSON.stringify(this.data));
       
        let keyValue = (a) => {
            return a[fieldname];
        };


       let isReverse = direction === 'asc' ? 1: -1;


           parseData.sort((x, y) => {
            x = keyValue(x) ? keyValue(x) : ''; 
            y = keyValue(y) ? keyValue(y) : '';
           
            return isReverse * ((x > y) - (y > x));
        });
        
        this.data = parseData;


    }

}