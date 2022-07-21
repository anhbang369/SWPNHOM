function ShowNotify(){
    if(document.getElementById('showValue').style.display === 'none'){
        document.getElementById('showValue').style.display = 'block';
    }else{
        document.getElementById('showValue').style.display = 'none';
    }
}

function ShowDateReceipt(){
    if(document.getElementById('showDateReceipt').style.display === 'none'){
        document.getElementById('showDateReceipt').style.display = 'block';
    }else{
        document.getElementById('showDateReceipt').style.display = 'none';
    }
}

function ShowDetailOrder(){
    if(document.getElementById('orderDetail').style.display === 'block'){
        document.getElementById('orderDetail').style.display = 'none';
    }else{
        document.getElementById('orderDetail').style.display = 'none';
    }
}

function ShowSort(){
    if(document.getElementById('sortLabel').style.display === 'none'){
        document.getElementById('sortLabel').style.display = 'block';
    }else{
        document.getElementById('sortLabel').style.display = 'none';
    }
}

function submitForm(){
      document.studentForm.action.value='UpdateReceiptDetailVirtual';
   }
function RDSearchForm(){
      document.RDSearch.action.value='ShowProductCreate';
   }
function RDPSearchForm(){
      document.RDPSearch.action.value='AddVirtualReceiDetail';
   }
function RdSearchForm(){
      document.RdSearch.action.value='SearchReceiptDate';
   }
function RSearchForm(){
      document.RSearch.action.value='SeacrhReceipt';
   }
function SRDSearchForm(){
      document.SRDSearch.action.value='ShowDetailReceipt';
   }
function OSearchForm(){
      document.OSearch.action.value='SearchIssue';
   }
function SIDSearchForm(){
      document.SIDSearch.action.value='ShowDetailOrder';
   }
function SIdSearchForm(){
      document.SIdSearch.action.value='SearchIssueDate';
   }
function OISearchForm(){
      document.SIDSearch.action.value='InsertIssue';
   }
function OdSearchForm(){
      document.OdSearch.action.value='SearchOrderDate';
   }
function OOSearchForm(){
      document.OOSearch.action.value='SeacrhOrder';
   }
function SRSearchForm(){
      document.SRSearch.action.value='ShowReport';
   }
function SRISearchForm(){
      document.SRISearch.action.value='SearchInventoryAlpha';
   }
function SRIdSearchForm(){
      document.SRIdSearch.action.value='SearchInventory';
   }
function CISearchForm(){
      document.CISearch.action.value='UpdateIssue';
   }
function PRSearchForm(){
      document.PRSearch.action.value='ShowProductReprot';
   }
function APRSearchForm(){
      document.APRSearch.action.value='AddVirtualInventory';
   }
function AVRSearchForm(){
      document.AVRSearch.action.value='UpdateInventoryVirtua';
   }
