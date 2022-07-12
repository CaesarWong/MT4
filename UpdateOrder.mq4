//+------------------------------------------------------------------+
//|                                                UpdateOrder.mq4 |
//|                                                       CaesarWong |
//|                                https://github.com/CaesarWong/MT4 |
//+------------------------------------------------------------------+
#property copyright "CaesarWong"
#property link      "https://github.com/CaesarWong/MT4"
#property version   "1.00"
#property strict
#property script_show_inputs
//--- input parameters
enum XOrderType
  {
   Sell=OP_SELL,
   Buy=OP_BUY,
   SellLimit=OP_SELLLIMIT,
   BuyLimit=OP_BUYLIMIT,
   SellStop=OP_SELLSTOP,
   BuyStop=OP_BUYSTOP,
  };

input XOrderType mOrderType=Sell;
input double mTakeProfit=0;
input double mStopLoss=0;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   int total=OrdersTotal();
   for(int pos=0; pos<total; pos++)
     {
      if(OrderSelect(pos,SELECT_BY_POS)==false)
         continue;
      if(OrderType()== mOrderType)
        {
         bool res=OrderModify(OrderTicket(),OrderOpenPrice(),mStopLoss,mTakeProfit,0);
         if(!res)
            Print("Error in OrderModify. Error code=",GetLastError());
         else
            Print("Order modified successfully.");
        }
     }
  }
//+------------------------------------------------------------------+
