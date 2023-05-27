param([String]$filepath);

# read all csv lines into an array
$data = Import-csv -Path $filepath -Header "enum", "desc" -Delimiter "|"
foreach($i in $data)
{
   if ($i.desc == "" or $i.desc == null)
   {
      echo "ups"
   }

   write("            <xs:enumeration value=`""+ $i.enum + "`">");
   write("               <xs:annotation>");
   write("                  <xs:appinfo>" + $i.desc + "</xs:appinfo>");
   write("               </xs:annotation>");
   write("            </xs:enumeration>");
}
   
