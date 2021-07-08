
using System;
using System.Management.Automation;
using System.Data;
using System.Collections.Generic;

namespace PSKafka

{

    [Cmdlet(VerbsData.Out, "SqlTable")]
    [OutputType(typeof(DataTable))]
    public class OutSqlTable : Cmdlet
    {

        [Parameter(Mandatory = true, ValueFromPipeline = true)]
        public PSObject InputObject { get; set; }

        [Parameter()]
        public SwitchParameter DDL;

        public DataTable dataTable = new DataTable();

        public HashSet<String> _validTypes = new HashSet<string>{
                "System.Boolean",
                "System.Byte[]",
                "System.Byte",
                "System.Char",
                "System.Datetime",
                "System.Decimal",
                "System.Double",
                "System.Guid",
                "System.Int16",
                "System.Int32",
                "System.Int64",
                "System.Single",
                "System.UInt16",
                "System.UInt32",
                "System.UInt64"
        };

        protected override void BeginProcessing()
        {
            base.BeginProcessing();
        }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            if (dataTable.Columns.Count == 0)
            {
                foreach (var prop in InputObject.Properties)
                {
                    dataTable.Columns.Add(
                        prop.Name,
                        _validTypes.Contains(prop.TypeNameOfValue) ? Type.GetType(prop.TypeNameOfValue) : typeof(String)
                    );
                }
            }

            var dr = dataTable.NewRow();
            foreach (var prop in InputObject.Properties)
            {
                if (prop.Value != null)
                {
                    dr[prop.Name] = prop.Value;
                }
            }
            dataTable.Rows.Add(dr);
        }

        protected override void EndProcessing()

        {
            base.EndProcessing();
            WriteObject(dataTable);
        }

    }

}
