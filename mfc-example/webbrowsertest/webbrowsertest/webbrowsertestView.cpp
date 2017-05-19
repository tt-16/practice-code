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

// webbrowsertestView.cpp : CwebbrowsertestView ���ʵ��
//

#include "stdafx.h"
#include "webbrowsertest.h"

#include "webbrowsertestDoc.h"
#include "webbrowsertestView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CwebbrowsertestView

IMPLEMENT_DYNCREATE(CwebbrowsertestView, CHtmlView)

BEGIN_MESSAGE_MAP(CwebbrowsertestView, CHtmlView)
	// ��׼��ӡ����
	ON_COMMAND(ID_FILE_PRINT, &CHtmlView::OnFilePrint)
END_MESSAGE_MAP()

// CwebbrowsertestView ����/����

CwebbrowsertestView::CwebbrowsertestView()
{
	// TODO: �ڴ˴���ӹ������

}

CwebbrowsertestView::~CwebbrowsertestView()
{
}

BOOL CwebbrowsertestView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: �ڴ˴�ͨ���޸�
	//  CREATESTRUCT cs ���޸Ĵ��������ʽ

	return CHtmlView::PreCreateWindow(cs);
}

void CwebbrowsertestView::OnInitialUpdate()
{
	CHtmlView::OnInitialUpdate();

	Navigate2(_T("file:///C:/WebBrowserApplication/HtmlData/power_default.html"),NULL,NULL);
}


// CwebbrowsertestView ��ӡ


void CwebbrowsertestView::OnFilePrintPreview()
{
	AFXPrintPreview(this);
}


void CwebbrowsertestView::OnRButtonUp(UINT nFlags, CPoint point)
{
	ClientToScreen(&point);
	OnContextMenu(this, point);
}

void CwebbrowsertestView::OnContextMenu(CWnd* pWnd, CPoint point)
{
	theApp.GetContextMenuManager()->ShowPopupMenu(IDR_POPUP_EDIT, point.x, point.y, this, TRUE);
}


// CwebbrowsertestView ���

#ifdef _DEBUG
void CwebbrowsertestView::AssertValid() const
{
	CHtmlView::AssertValid();
}

void CwebbrowsertestView::Dump(CDumpContext& dc) const
{
	CHtmlView::Dump(dc);
}

CwebbrowsertestDoc* CwebbrowsertestView::GetDocument() const // �ǵ��԰汾��������
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CwebbrowsertestDoc)));
	return (CwebbrowsertestDoc*)m_pDocument;
}
#endif //_DEBUG


// CwebbrowsertestView ��Ϣ�������
