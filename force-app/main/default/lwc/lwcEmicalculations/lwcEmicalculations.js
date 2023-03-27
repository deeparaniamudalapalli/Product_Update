import { LightningElement } from 'lwc';

export default class LwcEmicalculations extends LightningElement {}

var loan=document.getElementById('amount').value;
    
var interestRate=document.getElementById('apr').value;
var tenure=document.getElementById('tenure').value;

var noOfMonths=Math.floor(tenure)*12;
var monthlyRate=interestRate/(12*100);
var onePlusR=Math.pow(1+monthlyRate,noOfMonths)
var denominator=onePlusR-1;
var emi=(loan*monthlyRate*(onePlusR/denominator)).toPrecision(5);
var totalAmt=noOfMonths*parseFloat(emi);
var totalInt=Math.floor(totalAmt-loan);

var payableEmi=document.getElementById('emi');
var payableamount=document.getElementById('totalAmt');
var payableInt=document.getElementById('totalInt');
payableEmi.innerHTML=parseFloat(emi);