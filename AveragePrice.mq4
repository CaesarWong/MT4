//+------------------------------------------------------------------+
//|                                                 AveragePrice.mq4 |
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
  };

input XOrderType mOrderType=Sell;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   double totalPrice=0;
   double totalLots=0;
   int total=OrdersTotal();
   for(int pos=0; pos<total; pos++)
     {
      if(OrderSelect(pos,SELECT_BY_POS)==false)
         continue;
      if(OrderType()== mOrderType)
        {
         totalPrice+=OrderOpenPrice()*OrderLots();
         totalLots+=OrderLots();
        }
     }
   double averagePrice=totalLots==0?0:(totalPrice/totalLots);
   MessageBox(StringFormat("average=%f",averagePrice));
  }
//+------------------------------------------------------------------+
