namespace DQ3SFC.Text.DialogScript;

internal class Font {

	private const int LOOKUP_TABLE_START = 0x151aa;
	private const int PTR_TO_FONT_BANK_NUM = 0x1bbd5;
	private const int STRUCT_SIZE = 5;
	private const int NUM_CHAR_GROUPS = 50;
	private const int MAX_DIMEN = 0x10;

	// -------------------------------------------------------------------------

	private static readonly int[] widthTable = new int[NUM_CHAR_GROUPS];
	private static int[] heightTable = new int[NUM_CHAR_GROUPS];
	private static int[] groupSizeTable = new int[NUM_CHAR_GROUPS];
	private static int[] offsetTable = new int[NUM_CHAR_GROUPS];



	private static void readLookupTable(Rom rom) {

		//// get the bank number for the font (should be 0xC1)
		//// turn it into a "ROM file" base offset, as in not a HiROM CPU offset
		//romStream.seek(PTR_TO_FONT_BANK_NUM);
		//      int fontBank = romStream.readUnsignedByte();
		//int fontBankOffset = 0x10000 * (fontBank & 0x3F);

		//int totalCharsSoFar = 0x201;
		//romStream.seek(LOOKUP_TABLE_START);
		//      for (int i = 0; i<NUM_CHAR_GROUPS; i++) {
		//          // format of 5-byte lookup table entry:
		//          // 00000000 11111111 22222222 33333333 44444444
		//          // ssssssss WWWWssss [bank C1  offset] 00HHHH00

		//          int data[] = new int[STRUCT_SIZE];
		//          for (int j = 0; j<STRUCT_SIZE; j++) {
		//              data[j] = romStream.readUnsignedByte();
		//            }

		//	groupSizeTable[i] = (data[0] | (data[1] << 8)) & 0xFFF;
		//            widthTable[i]     = data[1] >> 4;
		//            heightTable[i]    = data[4] >> 2;
		//            offsetTable[i]    = fontBankOffset + (data[2] | (data[3] << 8));

		//            String rangeInfo = "";
		//            if (groupSizeTable[i] == 1) {
		//                rangeInfo = "char  (%3X)    ";
		//                rangeInfo = String.format(rangeInfo, totalCharsSoFar);
		//            }

		//			else {
		//	int lastCharInGroup = totalCharsSoFar + groupSizeTable[i] - 1;
		//	rangeInfo = "chars (%3X-%3X)";
		//	rangeInfo = String.format(rangeInfo, totalCharsSoFar, lastCharInGroup);
		//}
		//String info = "Group %2d has %3X %X*%X %s at 0x%6X\n";
		//System.out.printf(info, i + 1, groupSizeTable[i], widthTable[i], heightTable[i], rangeInfo, offsetTable[i]);

		//totalCharsSoFar += groupSizeTable[i];
		//        }
	}
}

