
// webtestDoc.cpp : CwebtestDoc 类的实现
//

#include "stdafx.h"
#include "webtest.h"

#include "webtestDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CwebtestDoc

IMPLEMENT_DYNCREATE(CwebtestDoc, CDocument)

BEGIN_MESSAGE_MAP(CwebtestDoc, CDocument)
END_MESSAGE_MAP()


// CwebtestDoc 构造/析构

CwebtestDoc::CwebtestDoc()
{
	// TODO: 在此添加一次性构造代码

}

CwebtestDoc::~CwebtestDoc()
{
}

BOOL CwebtestDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: 在此添加重新初始化代码
	// (SDI 文档将重用该文档)

	return TRUE;
}




// CwebtestDoc 序列化

void CwebtestDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: 在此添加存储代码
	}
	else
	{
		// TODO: 在此添加加载代码
	}
}


// CwebtestDoc 诊断

#ifdef _DEBUG
void CwebtestDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CwebtestDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG


// CwebtestDoc 命令
