
// webtestView.h : CwebtestView ��Ľӿ�
//


#pragma once


class CwebtestView : public CHtmlView
{
protected: // �������л�����
	CwebtestView();
	DECLARE_DYNCREATE(CwebtestView)

// ����
public:
	CwebtestDoc* GetDocument() const;

// ����
public:

// ��д
public:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
protected:
	virtual void OnInitialUpdate(); // ������һ�ε���

// ʵ��
public:
	virtual ~CwebtestView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// ���ɵ���Ϣӳ�亯��
protected:
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // webtestView.cpp �еĵ��԰汾
inline CwebtestDoc* CwebtestView::GetDocument() const
   { return reinterpret_cast<CwebtestDoc*>(m_pDocument); }
#endif

