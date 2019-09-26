state("EDF5", "Unpatched Retail Final")
{
	uint TotalResourcesCount : "EDF5.exe", 0x125ABD0, 0x70;
	uint LoadedResourcesCount : "EDF5.exe", 0x125ABD0, 0x38, 0x10;
}

isLoading
{
	return current.TotalResourcesCount != current.LoadedResourcesCount;
}