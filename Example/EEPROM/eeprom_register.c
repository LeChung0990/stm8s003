void Write_EEPROM(uint8_t Data)
{
	FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
	FLASH->DUKR = FLASH_RASS_KEY1;

	*(PointerAttr uint8_t *)(MemoryAddressCast)0x4000 = Data;
	FLASH->IAPSR &= (uint8_t)FLASH_MEMTYPE_DATA;
}
uint8_t Read_EEPROM(uint32_t Address)
{
	uint8_t Data;
	Data = *(PointerAttr uint8_t *)(MemoryAddressCast)Address;
	return Data;
}