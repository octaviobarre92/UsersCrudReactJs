xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://ws.hlt.pa.sura.insis.com/";
(:: import schema at "../NXSD/Poliza_Insis_RS.xsd" ::)
declare namespace ns1="http://www.fadata.bg/Insurance_Messages/v3.0/xml/";
(:: import schema at "../../../ComponentesComunesInsis/WSDL/insisPAM.wsdl" ::)

declare variable $RespuestaWS as element() (:: schema-element(ns1:RegisterApplicationRs) ::) external;

declare function local:func($RespuestaWS as element() (:: schema-element(ns1:RegisterApplicationRs) ::)) as element() (:: schema-element(ns2:RegisterApplicationRs) ::) {
    <ns2:RegisterApplicationRs>
        <ns2:POLIZA_CODIGO>{fn:data($RespuestaWS/ns1:PolicyID)}</ns2:POLIZA_CODIGO>
        <ns2:POLIZA>{fn:data($RespuestaWS/ns1:PolicyNo)}</ns2:POLIZA>
        {
            for $Installment in $RespuestaWS/ns1:Installments/ns1:Installment
            return 
            <ns2:CUOTAS>
                <ns2:ANEXO_ID>{fn:data($Installment/ns1:AnnexID)}</ns2:ANEXO_ID>
                <ns2:MONTO>{fn:data($Installment/ns1:Amount)}</ns2:MONTO>
                <ns2:MONEDA>{fn:data($Installment/ns1:Currency)}</ns2:MONEDA>
                {
                    if ($Installment/ns1:DateToPay)
                    then <ns2:FECHA_PAGO>{fn:data($Installment/ns1:DateToPay)}</ns2:FECHA_PAGO>
                    else ()
                }</ns2:CUOTAS>
        }
        <ns2:PLANES_PAGO>
            {
                for $Installment1 in $RespuestaWS/ns1:PaymentPlan/ns1:Installment
                return 
                <ns2:CUOTAS>
                    <ns2:PLAN_PAGO_ID>{fn:data($Installment1/ns1:PlanID)}</ns2:PLAN_PAGO_ID>
                    <ns2:ANEXO_ID>{fn:data($Installment1/ns1:AnnexID)}</ns2:ANEXO_ID>
                    <ns2:MONTO>{fn:data($Installment1/ns1:Amount)}</ns2:MONTO>
                    {
                        if ($Installment1/ns1:Currency)
                        then <ns2:MONEDA>{fn:data($Installment1/ns1:Currency)}</ns2:MONEDA>
                        else ()
                    }
                    {
                        if ($Installment1/ns1:DueDate)
                        then <ns2:FECHA_PAGO>{fn:data($Installment1/ns1:DueDate)}</ns2:FECHA_PAGO>
                        else ()
                    }
                    {
                        if ($Installment1/ns1:InstalmentPerYear)
                        then <ns2:CUOTAS_ANUALES>{fn:data($Installment1/ns1:InstalmentPerYear)}</ns2:CUOTAS_ANUALES>
                        else ()
                    }
                    {
                        if ($Installment1/ns1:InvoiceNo)
                        then <ns2:FACTURA_NUMERO>{fn:data($Installment1/ns1:InvoiceNo)}</ns2:FACTURA_NUMERO>
                        else ()
                    }</ns2:CUOTAS>
            }
        </ns2:PLANES_PAGO>        
    </ns2:RegisterApplicationRs>
};

local:func($RespuestaWS)
