import { readFileSync, statSync, existsSync } from 'fs';
import { join } from 'path';
import { NextResponse } from 'next/server';

export async function GET() {
  try {
    const publicDir = join(process.cwd(), 'public');
    const filePath = join(publicDir, 'icon-192x192.png');
    
    // Check if file exists
    if (!existsSync(filePath)) {
      return NextResponse.json({ error: 'File not found', path: filePath }, { status: 404 });
    }
    
    // Read file content
    const content = readFileSync(filePath);
    
    // Return file content
    return new NextResponse(content, {
      headers: {
        'Content-Type': 'image/png',
        'Content-Length': statSync(filePath).size.toString(),
      },
    });
  } catch (error: any) {
    return NextResponse.json({ 
      error: 'Error reading file', 
      message: error.message 
    }, { status: 500 });
  }
}
