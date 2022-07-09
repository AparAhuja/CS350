#include "disk.h"
#include "fs.h"

#include <stdio.h>
#include <string.h>
#include <math.h>

#define min(a,b) (((a) < (b)) ? (a) : (b))

#ifdef DEBUG
#define DEBUG_PRINT(fmt, args...)    fprintf(stderr, fmt, ## args)
#else
#define DEBUG_PRINT(fmt, args...)    /* Don't do anything in release builds */
#endif

// Debug file system -----------------------------------------------------------

void fs_debug(Disk *disk)
{
    if (disk == 0)
        return;

    Block block;

    // Read Superblock
    disk_read(disk, 0, block.Data);

    uint32_t magic_num = block.Super.MagicNumber;
    uint32_t num_blocks = block.Super.Blocks;
    uint32_t num_inodeBlocks = block.Super.InodeBlocks;
    uint32_t num_inodes = block.Super.Inodes;

    if (magic_num != MAGIC_NUMBER)
    {
        printf("Magic number is invalid: %c\n", magic_num);
        return;
    }

    printf("SuperBlock:\n");
    printf("    magic number is valid\n");
    printf("    %u blocks\n", num_blocks);
    printf("    %u inode blocks\n", num_inodeBlocks);
    printf("    %u inodes\n", num_inodes);

    uint32_t expected_num_inodeBlocks = round((float)num_blocks / 10);

    if (expected_num_inodeBlocks != num_inodeBlocks)
    {
        printf("SuperBlock declairs %u InodeBlocks but expect %u InodeBlocks!\n", num_inodeBlocks, expected_num_inodeBlocks);
    }

    uint32_t expect_num_inodes = num_inodeBlocks * INODES_PER_BLOCK;
    if (expect_num_inodes != num_inodes)
    {
        printf("SuperBlock declairs %u Inodes but expect %u Inodes!\n", num_inodes, expect_num_inodes);
    }

    // FIXME: Read Inode blocks
    int cnt = 1;
    for(int i = 1; i <= num_inodeBlocks; i++){
        disk_read(disk, i, block.Data);
        for(int j = 0; j < INODES_PER_BLOCK; j++){
            Inode inode = block.Inodes[j];
            if(!inode.Valid){continue;}
            printf("Inode %d:\n", cnt);
            printf("    size: %u bytes\n", inode.Size);
            printf("    direct blocks:");
            for(int k = 0; k < POINTERS_PER_INODE; k++){
                if(inode.Direct[k]!=0)
                    printf(" %u", inode.Direct[k]);
            }printf("\n");
            if(inode.Indirect != 0){
                printf("    indirect block: %u\n", inode.Indirect);
                printf("    indirect data blocks:");
                disk_read(disk, inode.Indirect, block.Data);
                for(int i= 0; i < BLOCK_SIZE; i++){
                    if(block.Data[i]!=0)
                        printf(" %u", block.Data[i]);
                }printf("\n");
            }
        }
    }
    printf("%u disk block reads\n", disk->Reads);
    printf("%u disk block writes\n", disk->Writes);
}

// Format file system ----------------------------------------------------------

bool fs_format(Disk *disk)
{
    if(disk_mounted(disk)){
        return false;
    }
    // Write superblock
    Block superblock;
    superblock.Super.MagicNumber = MAGIC_NUMBER;
    superblock.Super.Blocks = disk.Blocks;
    superblock.Super.InodeBlocks = round((float)disk.Blocks / 10);
    superblock.Super.Inodes = 0;
    disk_write(disk, 0, superblock);
    // Clear all other blocks
    Block inodeBlock;
    for(int i = 0; i < INODES_PER_BLOCK; i++){
        inodeBlock.Inodes[i].Valid = 0;
    }
    for(int i = 1; i <= superblock.Super.InodeBlocks; i++){
        disk_write(disk, i, inodeBlock.Data);
    }
    Block data;
    for(int i = superblock.Super.InodeBlocks + 1; i < superblock.Super.Blocks; i++){
        disk_write(disk, i, data.Data);
    }
    return true;
}

// FileSystem constructor 
FileSystem *new_fs()
{
    FileSystem *fs = malloc(sizeof(FileSystem));
    return fs;
}

// FileSystem destructor 
void free_fs(FileSystem *fs)
{
    // FIXME: free resources and allocated memory in FileSystem

    free(fs);
}

// Mount file system -----------------------------------------------------------

bool fs_mount(FileSystem *fs, Disk *disk)
{
    // Read superblock
    Block superblock;
    disk_read(disk, 0, superblock.Data);
    // Set device and mount
    fs->disk = disk;
    disk->mount();
    // Copy metadata
    uint32_t magic_num = superblock.Super.MagicNumber;
    uint32_t num_blocks = superblock.Super.Blocks;
    uint32_t num_inodeBlocks = superblock.Super.InodeBlocks;
    uint32_t num_inodes = superblock.Super.Inodes;
    // Allocate free block bitmap MISSING HEREEE
    
    return false;
}

// Create inode ----------------------------------------------------------------

ssize_t fs_create(FileSystem *fs)
{
    // Locate free inode in inode table

    // Record inode if found

    return -1;
}

// Optional: the following two helper functions may be useful. 

 bool find_inode(FileSystem *fs, size_t inumber, Inode *inode)
 {
     uint32_t block_number = inumber/INODES_PER_BLOCK + 1;
     Block block;
     disk_read(fs->disk, block_number, block.Data);
     if(block_number == 1)
         inode = block.Inodes[inumber - 1];
     else
         inode = block.Inodes[inumber - (block_number - 1)*INODES_PER_BLOCK];
     return true;
 }

 bool store_inode(FileSystem *fs, size_t inumber, Inode *inode)
 {
     uint32_t block_number = inumber/INODES_PER_BLOCK + 1;
     Block block;
     disk_read(fs->disk, block_number, block.Data);
     if(block_number == 1)
         block.Inodes[inumber - 1] = &inode;
     else
         block.Inodes[inumber - (block_number - 1)*INODES_PER_BLOCK] = &inode;
     disk_write(fs->disk, block_number, block.Data);
     return true;
 }

// Remove inode ----------------------------------------------------------------

bool fs_remove(FileSystem *fs, size_t inumber)
{
    // Load inode information

    // Free direct blocks

    // Free indirect blocks

    // Clear inode in inode table

    return false;
}

// Inode stat ------------------------------------------------------------------

ssize_t fs_stat(FileSystem *fs, size_t inumber)
{
    // Load inode information
    return 0;
}

// Read from inode -------------------------------------------------------------

ssize_t fs_read(FileSystem *fs, size_t inumber, char *data, size_t length, size_t offset)
{
    // Load inode information

    // Adjust length

    // Read block and copy to data
    
    return 0;
}

// Optional: the following helper function may be useful. 

// ssize_t fs_allocate_block(FileSystem *fs)
// {
//     return -1;
// }

// Write to inode --------------------------------------------------------------

ssize_t fs_write(FileSystem *fs, size_t inumber, char *data, size_t length, size_t offset)
{
    // Load inode
    
    // Write block and copy to data

    return 0;
}
