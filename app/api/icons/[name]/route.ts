import { readFileSync, statSync, existsSync } from 'fs';
import { join } from 'path';
import { NextRequest, NextResponse } from 'next/server';

export async function GET(request: NextRequest, context: any) {
  try {
    // Get name from context.params
    const name = context.params?.name;
    
    // Check if name is provided
    if (!name) {
      return NextResponse.json({ error: 'Missing file name', context: context.params }, { status: 400 });
    }
    
    // Log for debugging
    console.log('Request for file:', name);
    
    const publicDir = join(process.cwd(), 'public');
    const filePath = join(publicDir, name);
    
    // Check if public directory exists
    if (!existsSync(publicDir)) {
      return NextResponse.json({ error: 'Public directory not found', path: publicDir }, { status: 404 });
    }
    
    // Check if file exists
    if (!existsSync(filePath)) {
      // List files in public directory for debugging
      const fs = require('fs');
      const files = fs.readdirSync(publicDir).filter((file: string) => file.includes('icon'));
      return NextResponse.json({ 
        error: 'File not found', 
        path: filePath, 
        availableFiles: files 
      }, { status: 404 });
    }
    
    // Check if it's a file
    const stats = statSync(filePath);
    if (!stats.isFile()) {
      return NextResponse.json({ error: 'Not a file' }, { status: 404 });
    }
    
    // Read file content
    const content = readFileSync(filePath);
    
    // Set appropriate content type
    let contentType = 'application/octet-stream';
    if (name.endsWith('.png')) {
      contentType = 'image/png';
    } else if (name.endsWith('.jpg') || name.endsWith('.jpeg')) {
      contentType = 'image/jpeg';
    } else if (name.endsWith('.svg')) {
      contentType = 'image/svg+xml';
    }
    
    // Return file content
    return new NextResponse(content, {
      headers: {
        'Content-Type': contentType,
        'Content-Length': stats.size.toString(),
      },
    });
  } catch (error: any) {
    return NextResponse.json({ 
      error: 'Error reading file', 
      message: error.message 
    }, { status: 500 });
  }
}
