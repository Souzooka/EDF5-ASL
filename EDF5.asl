state("EDF5", "Unpatched Retail Final")
{
	uint TotalResourcesCount : "EDF5.exe", 0x125ABD0, 0x70;
	uint LoadedResourcesCount : "EDF5.exe", 0x125ABD0, 0x38, 0x10;
	ulong MissionScriptPtr : "EDF5.exe", 0x125AB40, 0x28;
	bool MissionActive : "EDF5.exe", 0x125AB40, 0x28, 0x410;

	// prevent splits on gameoverevent
	float PlayerCurrentArmor : "EDF5.exe", 0x125AB70, 0xFFFFFFA0, 0x0, 0x10, 0x768, 0x1FC;
}

startup
{
	settings.Add("splits", true, "Split at end of missions.");
}

isLoading
{
	return current.TotalResourcesCount != current.LoadedResourcesCount;
}

split
{
	if (settings["splits"])
	{
		return old.MissionScriptPtr != 0 && current.MissionScriptPtr != 0 && 
			old.MissionActive && !current.MissionActive && current.PlayerCurrentArmor > 0;
	}

	return false;
}