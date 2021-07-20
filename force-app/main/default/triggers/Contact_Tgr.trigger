trigger Contact_Tgr on Contact (after insert,after update, after delete) 
{
	if(Trigger.IsInsert && Trigger.IsAfter)
	{
		ContactTriggerHelper.startApprovalProcess(Trigger.new);
		ContactTriggerHelper.ProcessSummary(Trigger.new);
	}
	if(Trigger.IsAfter && Trigger.IsUpdate)
	{
		ContactTriggerHelper.ProcessSummary(Trigger.new);
	}
	if(Trigger.IsAfter && Trigger.IsDelete)
	{
		ContactTriggerHelper.ProcessSummary(Trigger.old);
	}
	
}