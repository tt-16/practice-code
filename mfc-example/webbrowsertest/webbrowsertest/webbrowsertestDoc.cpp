// ��� MFC ʾ��Դ������ʾ���ʹ�� MFC Microsoft Office Fluent �û����� 
// ("Fluent UI")����ʾ������Ϊ�ο������ṩ�� 
// ���Բ��䡶Microsoft ������ο����� 
// MFC C++ ������渽����ص����ĵ���
// ���ơ�ʹ�û�ַ� Fluent UI ����������ǵ����ṩ�ġ�
// ��Ҫ�˽��й� Fluent UI ��ɼƻ�����ϸ��Ϣ�������  
// http://msdn.microsoft.com/officeui��
//
// ��Ȩ���� (C) Microsoft Corporation
// ��������Ȩ����

// webbrowsertestDoc.cpp : CwebbrowsertestDoc ���ʵ��
//

#include "stdafx.h"
#include "webbrowsertest.h"

#include "webbrowsertestDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CwebbrowsertestDoc

IMPLEMENT_DYNCREATE(CwebbrowsertestDoc, CDocument)

BEGIN_MESSAGE_MAP(CwebbrowsertestDoc, CDocument)
END_MESSAGE_MAP()


// CwebbrowsertestDoc ����/����

CwebbrowsertestDoc::CwebbrowsertestDoc()
{
	// TODO: �ڴ����һ���Թ������

}

CwebbrowsertestDoc::~CwebbrowsertestDoc()
{
}

BOOL CwebbrowsertestDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: �ڴ�������³�ʼ������
	// (SDI �ĵ������ø��ĵ�)

	return TRUE;
}




// CwebbrowsertestDoc ���л�

void CwebbrowsertestDoc::Serialize(CArchive& ar)
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


// CwebbrowsertestDoc ���

#ifdef _DEBUG
void CwebbrowsertestDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CwebbrowsertestDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG


// CwebbrowsertestDoc ����
