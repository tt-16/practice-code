
// webtestDoc.cpp : CwebtestDoc ���ʵ��
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


// CwebtestDoc ����/����

CwebtestDoc::CwebtestDoc()
{
	// TODO: �ڴ����һ���Թ������

}

CwebtestDoc::~CwebtestDoc()
{
}

BOOL CwebtestDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: �ڴ�������³�ʼ������
	// (SDI �ĵ������ø��ĵ�)

	return TRUE;
}




// CwebtestDoc ���л�

void CwebtestDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: �ڴ���Ӵ洢����
	}
	else
	{
		// TODO: �ڴ���Ӽ��ش���
	}
}


// CwebtestDoc ���

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


// CwebtestDoc ����
