param([String]$filepath);

# read all csv lines into an array
$data = Import-csv -Path $filepath -Header "enum", "desc" -Delimiter "|"
foreach($i in $data)
{
   write("            <xs:enumeration value=`""+ $i.enum + "`">");
   write("               <xs:annotation>");
   write("                  <xs:appinfo>" + $i.desc + "</xs:appinfo>");
   write("               </xs:annotation>");
   write("            </xs:enumeration>");
}
   
