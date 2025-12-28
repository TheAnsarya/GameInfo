using DQ3SFC.Attributes;
using DQ3SFC.Extensions;
using System;
using System.Collections.Generic;

namespace DQ3SFC;

class Program {

	static void Main(string[] args) {
		var startAddress = 0xc545ee;
		var length = 0xe;
		var data = Rom.Slice(startAddress, length);

		// $43d2,x	-	address
		// $43b2,x	-	databank
		var xx0 = data.Long(0);

		// $4452,x	-	address
		// $4432,x	-	databank
		// points to a long that is the address of the TileLayoutList data
		var tileListAddressPointer = data.Long(3);

		// $44b2,x
		var xx6 = data.Byte(6);

		// $44f2,x
		var xx7 = data.Word(7);

		// $4512,x
		var xx9 = data.Word(9);

		// $45f2,x
		var xxb = data.Word(0xb);

		// $4612,x
		var xxd = data.Byte(0xd) > 0x80 ? 0x8000 : data.Byte(0xd);

		//-----------------------------------------------------

		/*
C79D05 $A7 $4A         LDA [$4A] [F3541D] = $546E      A:00F3 X:0000 Y:000C S:06A9 D:199A DB:7E P:nvmxdIzc V:9   H:122
C79D07 $9D $92 $44     STA $4492,X [7E4492] = $6DAB    A:546E X:0000 Y:000C S:06A9 D:199A DB:7E P:nvmxdIzc V:9   H:146
C79D0A $A0 $02 $00     LDY #$0002                      A:546E X:0000 Y:000C S:06A9 D:199A DB:7E P:nvmxdIzc V:9   H:156
C79D0D $B7 $4A         LDA [$4A],Y [F3541F] = $81F3    A:546E X:0000 Y:0002 S:06A9 D:199A DB:7E P:nvmxdIzc V:9   H:160
C79D0F $29 $FF $00     AND #$00FF                      A:81F3 X:0000 Y:0002 S:06A9 D:199A DB:7E P:NvmxdIzc V:9   H:174
C79D12 $9D $72 $44     STA $4472,X [7E4472] = $00EE    A:00F3 X:0000 Y:0002 S:06A9 D:199A DB:7E P:nvmxdIzc V:9   H:178
		 */
		// $4492,x	-	address
		// $4472,x	-	databank
		var tileListAddress = Rom.All.Long(tileListAddressPointer);

		if (xx6 != 0x02) {
			// does some other stuff at $c79d2d
			// does some other stuff at $c79ea1 with graphicsAddress+2 (and the $dd89,X array)

			// Uses TileBank.Primary
			var tileList = new TileLayoutList(tileListAddress);



		} else {
			// is at $c79db1 
		}


		Console.ReadKey();
	}

	// for copying slime graphics to vram
	// tile numbers/offsets or skip destination commands
	// $ffxx means skip xx tiles in destination, used in "total tile count" thing
	class TileLayoutList {
		[FieldSize(Ima.Long)]
		public int Address { get; set; }

		[FieldSize(Ima.Word)]
		public int UnknownOne { get; set; }

		// not actual number tiles copied, for example the slime is 4 tiles:
		// endTileOffset is $12
		// write one tile, --, write one tile --
		// endTileOffset is $10
		// address/command is $ff0e so skip $0e (destination address is increased by $0e tiles, endTileOffset is decreased by $0e)
		// endTileOffset is $02
		// write one tile, --, write one tile --
		// endTileOffset is $00 so done
		[FieldSize(Ima.Word)]
		public int Size { get; set; }

		public List<Item> Items { get; set; } = [];

		public TileLayoutList(int address) {
			Address = address;
			Refresh();
		}

		public void Refresh() {
			var address = Address;
			UnknownOne = Rom.All.Word(address);
			var size = Size = Rom.All.Word(address + 2);

			address += 4;
			while (size > 0) {
				var value = Rom.All.Word(address);
				var item = new Item {
					IsTile = value < 0xff00,
					Value = value
				};

				Items.Add(item);
				address += 2;
				size -= item.IsTile ? 1 : item.Skip;
			}
		}

		public class Item {
			public bool IsTile { get; set; }

			[FieldSize(Ima.Word)]
			public int Value { get; set; }

			[FieldSize(Ima.Word)]
			public int Skip {
				get => Value & 0x00ff;
				set => Value = value | 0xff00;
			}

			[FieldSize(Ima.Word)]
			public int Index {
				get => Value;
			}
		}
	}


	// Tiles are 8x8 4bpp planar composite 1-dimensional
	class TileBank {
		// Main graphics bank at $ce0080
		// NumberOfTiles = 0xafc4
		public static readonly TileBank Primary = new() {
			// TODO: pull or verify address from rom
			// stored at $40 [0019DA]
			// described in code at:
			// c7c0b1 -- a9 80 00 85 40 a9 ce 00 85 42
			// c7c185 -- a9 80 00 85 40 a9 ce 00 85 42
			StartAddress = 0xce0080,

			// This is a guess based on looking in TileMolester
			// Non inclusive, last byte is at $e3f8ff
			EndAddress = 0xe3f900,

			// $20 bytes
			TileDataSize = 0x20
		};

		[FieldSize(Ima.Long)]
		public int StartAddress { get; set; }

		[FieldSize(Ima.Long)]
		public int EndAddress { get; set; }

		public int TileDataSize { get; set; }

		public int NumberOfTiles {
			get => (EndAddress - StartAddress) / TileDataSize;
		}

		public int AddressOf(int index) => StartAddress + (index << 5);

		public bool IsValidIndex(int index) => (0 <= index) && (index < NumberOfTiles);

		public Memory<byte> GetDataFor(int index) => Rom.Slice(AddressOf(index), TileDataSize);
	}
}

