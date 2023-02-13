xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://sura.com.pa/";
(:: import schema at "WSDL/EML_V2.wsdl" ::)


declare function local:func() as element() (:: schema-element(ns1:Medical_EvaluationrqResponse) ::) {
    <ns1:Medical_EvaluationrqResponse>
        <ns1:Medical_EvaluationrqResult>
            <ns1:INS_OBJ_ID></ns1:INS_OBJ_ID>
            <ns1:OBJ_ID></ns1:OBJ_ID>
            <ns1:PID>PA24680</ns1:PID>
            <ns1:POLICY_NO></ns1:POLICY_NO>
            <ns1:ANNEX_ID></ns1:ANNEX_ID>
            <ns1:OBJ_STATUS_EVAL>E4</ns1:OBJ_STATUS_EVAL>
            <ns1:NOTES></ns1:NOTES>
            <ns1:APROBADO_RECARGO>
                <ns1:VALUE></ns1:VALUE>
                <ns1:APPLY></ns1:APPLY>
                <ns1:TARIFF_DISC></ns1:TARIFF_DISC>
                <ns1:CALC_MODE></ns1:CALC_MODE>
            </ns1:APROBADO_RECARGO>
            <ns1:APROBADO_EXCLUSION>
                <ns1:ICD>
                    <ns1:DIAGNOSIS_CODE></ns1:DIAGNOSIS_CODE>
                    <ns1:DIAG_EXCL></ns1:DIAG_EXCL>
                </ns1:ICD>
                <ns1:SERVICES>
                    <ns1:SERVICE_CODE></ns1:SERVICE_CODE>
                    <ns1:SERVICE_NAME></ns1:SERVICE_NAME>
                    <ns1:SERVICES_EXCL></ns1:SERVICES_EXCL>
                </ns1:SERVICES>
            </ns1:APROBADO_EXCLUSION>
        </ns1:Medical_EvaluationrqResult>
    </ns1:Medical_EvaluationrqResponse>
};

local:func()
